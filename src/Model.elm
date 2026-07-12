module Model exposing (..)

import Element
import Theme exposing (Theme)
import Translation exposing
    ( Language
    , Translation
    )

type alias Model =
    { locale : Language
    , theme : Theme
    , device : Element.Device
    , skills : List Skill
    , toggledDropdowns : List String
    }

type alias Skill =
    { title : String
    , content : Translation
    , category : SkillCategory
    }

type SkillCategory
    = Language
    | LibraryFramework
