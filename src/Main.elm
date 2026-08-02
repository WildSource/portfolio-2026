module Main exposing (..)

import Browser exposing (Document)

import Components.ThemeSlider as ThemeSlider
import Components.LanguageSlider as LanguageSlider
import Components.HeroText as HeroText
import Components.Socials as Socials
import Components.Footer as Footer
import Components.MainContent as MainContent
import Browser.Events as E
import Data.Translation as T
import Data.Message as Message
import Data.Model as Model
import Element.Background as Background
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark

import Theme exposing (Theme (..))
import Data.Translation exposing (Language (..))
import Data.Model exposing (Model)
import Data.Message exposing (Msg)
import Data.Skill exposing (skills) 
import Data.Project exposing (projects)
import Element exposing
    ( width
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

        socialMedias =
            Socials.element config.theme
                            
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
                          [ sliders
                          , heroText
                          , socialMedias
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
                 
