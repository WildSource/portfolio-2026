module Main exposing (..)

import Task

import SimpleAnimation as SA
import Simple.Animation as Animation
import Simple.Animation.Property as AnimationProperty
import Components.BackToTopButton as BackTopButton
import Components.ThemeSlider as ThemeSlider
import Components.LanguageSlider as LanguageSlider
import Components.HeroText as HeroText
import Components.Socials as Socials
import Components.Footer as Footer
import Components.MainContent as MainContent
import Browser.Events as E
import Browser.Dom as Dom
import Data.Translation as T
import Data.Message as Message
import Data.Model as Model
import Element.Background as Background
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark

import Browser exposing (Document)
import Theme exposing (Theme (..))
import Data.Translation exposing (Language (..))
import Data.Model exposing (Model)
import Data.Message exposing (Msg)
import Data.Skill exposing (skills) 
import Data.Project exposing (projects)
import Simple.Animation exposing (Animation)
import Element exposing
    ( DeviceClass (..)
    , Orientation (..)
    , width
    , height
    , fill
    , alignRight
    , padding
    , spacing
    )

main : Program Flags Model Msg
main =
    Browser.document
       { init = init 
       , view = view
       , update = update
       , subscriptions = subscriptions
       }    
    
    
init : Flags -> (Model, Cmd Msg)
init ({ language, width, height } as flags) =
    let
        -- debug to remove
        _ = Debug.log "flags" flags
            
        device =
            Element.classifyDevice windowSize
                 
        windowSize =
            { width = width
            , height = height                
            }
            
        chosenLanguage =
            if String.startsWith "fr" language then
                T.FR
            else
                T.EN                
    in
        ( { config =
                { language = chosenLanguage
                , theme = Light
                , device = device
                }
          , data =
              { titles = T.titles
              , about = T.aboutContent
              , experience =                  
                  { title =
                        T.experienceJobTitle
                  , body =
                        T.experienceContent
                  }
              , skills = skills
              , projects = projects
              }
          , toggledDropdowns = []
          }
        , Cmd.none
        )


type alias Flags =
    { language : String
    , width : Int
    , height : Int        
    }

floatingAnimation : Animation
floatingAnimation =
    Animation.fromTo
        { duration = 2000
        , options =
              [ Animation.loop
              , Animation.yoyo
              , Animation.easeInOut
              ]
        }
        [AnimationProperty.y 15]
        [AnimationProperty.y -15]

    
view : Model -> Document Msg
view { config, data, toggledDropdowns } =
    let
        theme =
            case config.theme of
                Dark  -> GDark.bg

                         
                Light -> GLight.bg 

        sliders =
            Element.row
                [ width fill
                , padding 10
                ]
                [ ThemeSlider.element config.theme
                , Element.el [ alignRight ]
                      (LanguageSlider.element config)
                ]

        heroText =
            HeroText.element config

        animatedHeroText =
            SA.animatedElementWrapper
                floatingAnimation
                [ Element.centerX ]
                heroText

        heroElement =
            case config.device.class of
                Phone -> heroText

                         
                Tablet -> heroText

                          
                Desktop -> animatedHeroText

                           
                BigDesktop -> animatedHeroText

        socialMedias =
            Socials.element config.theme

        backToTopButton =
            let
                deviceClass = config.device.class

                deviceOrientation = config.device.orientation
                               
            in
                Element.el []
                    (case (deviceClass, deviceOrientation) of
                         (Phone, _) -> Element.none
                         

                         (Tablet, _) -> Element.none

                         
                         (Desktop, Portrait) -> Element.none

                         
                         (BigDesktop, Portrait) -> Element.none
                         
                         
                         _ -> BackTopButton.element config
                    )  
    in
        { title = "Samuel Nguyen-Phok"
        , body =
              [ Element.layoutWith
                    { options =
                          [ Element.focusStyle
                                { borderColor = Nothing
                                , backgroundColor = Nothing 
                                , shadow = Nothing
                                }                           
                          ]
                    }
                    [ Background.color theme ]
                    ( Element.column
                          [ width fill
                          , height fill
                          , spacing 10
                          ]
                          [ backToTopButton
                          , sliders
                          , heroElement
                          , socialMedias config.device.class
                          , MainContent.element
                              config
                              data
                              toggledDropdowns
                          , Footer.element config.theme
                          ]
                    )             
              ]
        }

        
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Message.None -> 
            (model, Cmd.none)

        Message.ScrollToTop ->
            ( model
            , Task.perform
                  (\ _ -> Message.None)
                  (Dom.setViewport 0 0)
            )

        Message.ToggleDropdown skillName ->
            ({ model |
                   toggledDropdowns =
                   let
                       dropdowns = model.toggledDropdowns
                   in
                       if List.member skillName dropdowns then
                           List.filter
                               (\ dropdown -> dropdown /= skillName)
                               dropdowns
                       else
                           skillName :: dropdowns
             }
            , Cmd.none
            )

        Message.LanguageSwitch isChecked ->
            let
                language =
                    if isChecked then
                        FR
                    else
                        EN
            in
                ( Model.updateLanguage model language
                , Cmd.none
                )

        Message.ThemeSwitch isChecked ->
            let
                theme = Theme.fromBool isChecked
            in
                ( Model.updateTheme model theme
                , Cmd.none
                )

        Message.WindowResize windowSize ->
            let
                device = Element.classifyDevice windowSize
                _ = Debug.log "sizes" windowSize
                _ = Debug.log "device" device
            in
                ( Model.updateDevice model device
                , Cmd.none
                )    

                
subscriptions : Model -> Sub Msg
subscriptions _ =
    E.onResize (\ width height -> Message.WindowResize {width = width, height = height})
                 
