module Components.LanguageSlider exposing (element)

import Component
import Model exposing (Model)
import Message exposing (Msg (..))
import Element exposing (Element)

import Element.Input as Input
import Translation as T


element : Model -> Element Msg
element model =
    let
        checked =
            if model.locale == T.EN then
                False
            else
                True

        sliderOn =
            Component.slider model True

        sliderOff =
            Component.slider model False                
    in
        Element.row
            [ Element.spacing 5 ]
            [ Element.text "EN"
            , Input.checkbox
                []
                { onChange = (\ isChecked -> LanguageSwitch isChecked)
                , icon = (\ isChecked -> if isChecked then sliderOn else sliderOff)
                , checked = checked
                , label = Input.labelHidden "Language switch"
                }
            , Element.el [Element.padding 10] (Element.text "FR")
            ]

            
