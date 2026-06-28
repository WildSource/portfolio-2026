module Main exposing (..)

import Browser
import Html exposing (Html)

main : Program () Model Msg
main =
    Browser.sandbox
       { init = init 
       , view = view
       , update = update 
       }

type alias Model = Int

type Msg = None    

init : Model
init = 0

view : Model -> Html Msg
view _ =
    Html.div
    []
    [Html.text "Hello World !"]

update : Msg -> Model -> Model
update _ model = model
                 
