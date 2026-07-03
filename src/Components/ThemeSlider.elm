module Components.ThemeSlider exposing (element)

import Icons

import Component
import Model exposing (Model)
import Message exposing (Msg (..))
import Element exposing (Element)

import Element.Input as Input
import Theme.Types as Type

element : Model -> Element Msg
element model =
    let            
        sliderOn =
            Component.slider ({ model | theme = Type.Dark }) True
                
        sliderOff =
            Component.slider ({ model | theme = Type.Light }) False
    in
        Element.row
            []
            [ Icons.sun 
            , Input.checkbox
                  []
                  { onChange = (\ isChecked -> ThemeSwitch isChecked)
                  , icon = (\ isChecked -> if isChecked then sliderOn else sliderOff)
                  , checked = Type.toBool model.theme
                  , label = Input.labelHidden "Theme switch"
                  }
            , Element.el [Element.padding 5] (Icons.moon model)
            ]
            
