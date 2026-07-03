
module Main exposing (..)

import Debug

import Components.ThemeSlider as ThemeSlider
import Components.LanguageSlider as LanguageSlider
import Components.HeroText as HeroText

import Browser
import Browser.Events as E

import Element exposing
    ( width
    , fill
    , alignRight
    )
import Element.Background as Background

import Theme.GruvboxLight as GLight
import Theme.GruvboxDark as GDark

import Theme.Types exposing (Theme (..))
import Theme.Types as Types

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
                theme = Types.fromBool isChecked
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
                 
