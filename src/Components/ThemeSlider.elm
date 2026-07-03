module Components.ThemeSlider exposing (element)

import Icons

import Component
import Theme exposing (Theme (..))
import Model exposing (Model)
import Message exposing (Msg (..))
import Element exposing (Element)

import Element.Input as Input


element : Model -> Element Msg
element model =
    let            
        sliderOn =
            Component.slider ({ model | theme = Dark }) True
                
        sliderOff =
            Component.slider ({ model | theme = Light }) False
    in
        Element.row
            []
            [ Icons.sun 
            , Input.checkbox
                  []
                  { onChange = (\ isChecked -> ThemeSwitch isChecked)
                  , icon = (\ isChecked -> if isChecked then sliderOn else sliderOff)
                  , checked = Theme.toBool model.theme
                  , label = Input.labelHidden "Theme switch"
                  }
            , Element.el [Element.padding 5] (Icons.moon model)
            ]
            
