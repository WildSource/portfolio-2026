module Main exposing (..)

import Browser exposing (Document)

import Components.ThemeSlider as ThemeSlider
import Components.LanguageSlider as LanguageSlider
import Components.HeroText as HeroText
import Components.Socials as Socials
import Components.Footer as Footer
import Components.MainContent as MainContent
import Browser.Events as E
import Data.Translation as Translation
import Data.Message as Message

import Element exposing
    ( width
    , fill
    , alignRight
    )
import Element.Background as Background

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark

import Theme exposing (Theme (..))

import Data.Translation exposing (Language (..))

import Data.Model exposing
    ( Model
    , SkillCategory (..)
    , skills
    , projects
    )

import Data.Message exposing (Msg)

{-
Notes on what to refactor.
+ pass either data as arguments to component if 2-3 arguments or less
otherwise switch to a record instead of passing whole model.

+ refactor model to include the static text as data in the model instead of hardcoded string literals
 -}


main : Program Flags Model Msg
main =
    Browser.document
       { init = init 
       , view = view
       , update = update
       , subscriptions = subscriptions
       }

    
type alias Flags =
    { language : String
    , width : Int
    , height : Int        
    }
    
    
init : Flags -> (Model, Cmd Msg)
init flags =
    let
        _ = Debug.log "flags" flags
        _ = Debug.log "device" device
            
        device = Element.classifyDevice windowSize
        windowSize =
            { width = flags.width
            , height = flags.height                
            }
        language =
            if String.startsWith "fr" flags.language then
                Translation.FR
            else
                Translation.EN                
    in
        ( { language = language
          , theme = Light
          , device = device
          , projects = projects
          , skills = skills
          , toggledDropdowns = []
          }
        , Cmd.none
        )

            
view : Model -> Document Msg
view model =
    let
        theme =
            Theme.evalTheme
                GDark.bg
                (Light, GLight.bg)
                model.theme

        sliders =
            Element.row
                [ width fill
                , Element.padding 10
                ]
                [ ThemeSlider.element model
                , Element.el [alignRight] (LanguageSlider.element model)
                ]
                
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
                          []
                          [ sliders
                          , HeroText.element
                              model.theme
                              model.language
                              model.device
                          , Socials.element model
                          , MainContent.element
                              model.theme
                              model.language
                              model.skills
                              model.toggledDropdowns
                          , Footer.element model
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
                ( { model | language = language }
                , Cmd.none
                )

        Message.ThemeSwitch isChecked ->
            let
                theme = Theme.fromBool isChecked
            in
                ( { model | theme = theme }
                , Cmd.none
                )

        Message.WindowResize windowSize ->
            let
                device = Element.classifyDevice windowSize
                _ = Debug.log "sizes" windowSize
                _ = Debug.log "device" device
            in
                ( { model | device = device }
                , Cmd.none
                )    
                 
subscriptions : Model -> Sub Msg
subscriptions _ =
    E.onResize (\ width height -> Message.WindowResize {width = width, height = height})
                 
