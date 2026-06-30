module Main exposing (..)

import Browser
import Element
import Components
import Message exposing (Msg)
import Translation exposing (Language)
import Theme exposing (Theme)
import Html exposing (Html)

    
main : Program String Model Msg
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
    }

    
init : String -> (Model, Cmd Msg)
init localeFlag =
    let 
        locale =
            if String.startsWith "fr" localeFlag then
                Translation.FR
            else
                Translation.EN                
    in
        ( { locale = locale
          , theme = Theme.Light
          }
        , Cmd.none
        )

            
view : Model -> Html Msg
view model =
    Element.layout
        []
        (Components.heroTitle model.locale)

        
update : Msg -> Model -> (Model, Cmd Msg)
update _ model =
    (model, Cmd.none)

                 
subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
                 
