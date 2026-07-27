module Data.Model exposing (Model)

import Element exposing (Device)
import Theme exposing (Theme)
import Data.Skill exposing (Skill)
import Data.Project exposing (Project)
import Data.Translation exposing (Language)


type alias Model =
    { config : Config
    , data : Data
    , toggledDropdowns : List String
    }

type alias Config =
    { language : Language
    , theme : Theme
    , device : Device
    }

type alias Data =
    { skills : List Skill
    , projects : List Project
    }

