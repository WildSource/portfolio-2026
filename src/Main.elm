module Main exposing (..)

import Debug
import Browser
import Browser.Events as E
import Element
import Components
import Message exposing (Msg)
import Translation exposing (Language)
import Theme exposing (Theme)
import Html exposing (Html)

    
main : Program Flags Model Msg
main =
    Browser.element
       { init = init 
       , view = view
       , update = update
       , subscriptions = subscriptions
       }

        
type alias Model =
    { locale : Language
    , theme : Theme
    , device : Element.Device
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
          , theme = Theme.Light
          , device = Element.classifyDevice windowSize
          }
        , Cmd.none
        )

            
view : Model -> Html Msg
view model =
    Element.layout
        []
        (Components.heroTitle model.locale model.device)

        
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Message.None -> 
            (model, Cmd.none)

        Message.WindowResize windowSize ->
            let
                device = Element.classifyDevice windowSize
                _ = Debug.log "device" device
            in
                ( { model | device = device }
                , Cmd.none
                )    
                 
subscriptions : Model -> Sub Msg
subscriptions _ =
    E.onResize (\ width height -> Message.WindowResize {width = width, height = height})
                 
