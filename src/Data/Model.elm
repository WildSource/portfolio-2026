module Data.Model exposing (..)

import Element
import Theme exposing (Theme)
import Data.Translation exposing
    ( Language
    , Translation
    )

type alias Model =
    { locale : Language
    , theme : Theme
    , device : Element.Device
    , skills : List Skill
    , projects : List Project
    , toggledDropdowns : List String
    }

type alias Skill =
    { title : String
    , content : Translation
    , category : SkillCategory
    }

type alias Project =
    { title : Translation
    , content : Translation
        
    }

type SkillCategory
    = Language
    | LibraryFramework
      
