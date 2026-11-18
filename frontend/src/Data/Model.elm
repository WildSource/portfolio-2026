module Data.Model exposing (..)

import Element exposing (Device)
import Theme exposing (Theme)
import Data.Skill exposing (Skill)
import Data.Project exposing (Project)
import Data.Translation exposing
    ( Language
    , Translation
    )


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
    { titles : List Translation
    , about : List Translation
    , experience : { title : Translation, body : List Translation }
    , skills : List Skill
    , projects : List Project
    }

updateLanguage : Model -> Language -> Model
updateLanguage model language =
    let
        modelConfig = model.config
                      
        modifiedConfig =
            { modelConfig | language = language }
    in 
        { model | config = modifiedConfig }

            
updateTheme : Model -> Theme -> Model
updateTheme model theme =
    let
        modelConfig = model.config
                      
        modifiedConfig =
            { modelConfig | theme = theme }
    in 
        { model | config = modifiedConfig }


updateDevice : Model -> Device -> Model
updateDevice model device =
    let
        modelConfig = model.config
                      
        modifiedConfig =
            { modelConfig | device = device }
    in 
        { model | config = modifiedConfig }            
                
