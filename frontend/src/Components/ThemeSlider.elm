module Components.ThemeSlider exposing (element)

import Icons

import Components.Patterns.Slider as Slider
import Theme exposing (Theme (..))
import Data.Message exposing (Msg (..))
import Element exposing (Element)

import Element.Input as Input


element : Theme -> Element Msg
element theme =
    let            
        sliderOn =
            Slider.element Dark True
                
        sliderOff =
            Slider.element Light False

        checkbox =
            Input.checkbox []
                { onChange =
                      (\ isChecked -> ThemeSwitch isChecked)
                , icon =
                      (\ isChecked -> if isChecked then sliderOn else sliderOff)
                , checked = Theme.toBool theme
                , label = Input.labelHidden "Theme switch"
                }

        moonIcon =
            Element.el [ Element.padding 5 ]
                (Icons.moon theme)
    in
        Element.row []
            [ Icons.sun 
            , checkbox
            , moonIcon
            ]
            
