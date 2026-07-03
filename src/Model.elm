module Model exposing (..)

import Element
import Theme exposing (Theme)
import Translation exposing (Language)

type alias Model =
    { locale : Language
    , theme : Theme
    , device : Element.Device
    }
    
