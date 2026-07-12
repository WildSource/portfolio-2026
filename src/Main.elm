module Main exposing (..)

import Browser exposing (Document)

import Component exposing (debugBorder)

import Components.ThemeSlider as ThemeSlider
import Components.LanguageSlider as LanguageSlider
import Components.HeroText as HeroText
import Components.Socials as Socials
import Components.Footer as Footer
import Components.MainContent as MainContent
import Browser.Events as E


import Element exposing
    ( width
    , fill
    , alignRight
    )
import Element.Background as Background

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark

import Theme exposing (Theme (..))

import Translation exposing (Language (..))

import Model exposing
    ( Model
    , SkillCategory (..)
    )

import Message exposing (Msg)

import Html exposing (Html)

    
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
        locale =
            if String.startsWith "fr" flags.language then
                Translation.FR
            else
                Translation.EN                
    in
        ( { locale = locale
          , theme = Light
          , device = device
          , skills =              
                [ { title = "Haskell"
                  , content = { en = "", fr = "" }
                  , category = Language
                  }
                , { title = "Java"
                  , content = { en = "", fr = "" }
                  , category = Language
                  }
                , { title = "Elm"
                  , content = { en = "", fr = "" }
                  , category = Language
                  }
                , { title = "Php"
                  , content = { en = "", fr = "" }
                  , category = Language
                  }
                , { title = "Javascript"
                  , content = { en = "", fr = "" }
                  , category = Language
                  }
                , { title = "Typescript"
                  , content = { en = "", fr = "" }
                  , category = Language
                  }
                , { title = "Html"
                  , content = { en = "", fr = "" }
                  , category = Language
                  }
                , { title = "CSS"
                  , content = { en = "", fr = "" }
                  , category = Language
                  }
                , { title = "SpringBoot"
                  , content = { en = "", fr = "" }
                  , category = LibraryFramework
                  }
                , { title = "Scotty"
                  , content = { en = "", fr = "" }
                  , category = LibraryFramework
                  }
                , { title = "Servant"
                  , content = { en = "", fr = "" }
                  , category = LibraryFramework
                  }
                , { title = "React"
                  , content = { en = "", fr = "" }
                  , category = LibraryFramework
                  }
                , { title = "Angular"
                  , content = { en = "", fr = "" }
                  , category = LibraryFramework
                  } 
                ]
          , toggledDropdowns = []
          }
        , Cmd.none
        )

            
view : Model -> Document Msg
view model =
    let
        theme =
            if model.theme == Light then
                GLight.bg
            else
                GDark.bg

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
                          , HeroText.element model
                          , Socials.element model
                          , MainContent.element model
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
                locale =
                    if isChecked then
                        FR
                    else
                        EN
            in
                ( { model | locale = locale }
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
                 
