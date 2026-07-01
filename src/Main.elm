module Main exposing (..)

import Debug

import Components

import Browser
import Browser.Events as E

import Element
import Element.Background as Background

import Theme.GruvboxLight as GLight
import Theme.GruvboxDark as GDark

import Translation exposing (Language (..))
import Theme.Types exposing (Theme (..))
import Theme.Types as Types
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
                GLight.bgColor
            else
                GDark.bgColor                    
    in
    Element.layout
        [ Background.color theme ]
        ( Element.column
              []
              [ Components.themeSlider model
              , Components.heroTitle model
              ]
        )

        
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Message.None -> 
            (model, Cmd.none)

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
                 
