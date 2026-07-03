
module Main exposing (..)

import Debug
import Browser
import Component

import Translation as T
import Components.ThemeSlider as ThemeSlider
import Components.LanguageSlider as LanguageSlider
import Components.HeroText as HeroText
import Components.Card as Card
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

import Model exposing (Model)

import Message exposing (Msg)

import Html exposing (Html)

    
main : Program Flags Model Msg
main =
    Browser.element
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
          }
        , Cmd.none
        )

            
view : Model -> Html Msg
view model =
    let
        theme =
            if model.theme == Light then
                GLight.bg
            else
                GDark.bg
        mainContent =
            Element.column
                [ Element.centerX
                , Element.width Element.fill
                , Element.padding 20
                , Element.spacing 20
                ]
                [ Card.element model T.aboutTitle T.aboutContent
                , Card.element model T.experiencesTitle T.experiencesContent
                , Card.element model T.technologyTitle T.technologyContent
                ]
    in
        Element.layout
        [ Background.color theme ]
        ( Element.column
              []
              [ Element.row
                    [ width fill]
                    [ ThemeSlider.element model
                    , Element.el [alignRight] (LanguageSlider.element model)
                    ]
              , HeroText.element model
              , mainContent
              ]
        )

        
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Message.None -> 
            (model, Cmd.none)

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
                 
