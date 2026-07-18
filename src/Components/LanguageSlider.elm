module Components.LanguageSlider exposing (element)

import Component
import Data.Model exposing (Model)
import Data.Message exposing (Msg (..))
import Element exposing (Element)
import Theme exposing (Theme (..))

import Element.Input as Input
import Element.Font as Font
import Data.Translation as T

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


element : Model -> Element Msg
element model =
    let
        fontColor =
            if model.theme == Light then
                GLight.fg0
            else
                GDark.fg0
        
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
            [ Element.el
                  [ Font.color fontColor]
                  (Element.text "EN")
            , Input.checkbox
                []
                { onChange = (\ isChecked -> LanguageSwitch isChecked)
                , icon = (\ isChecked -> if isChecked then sliderOn else sliderOff)
                , checked = checked
                , label = Input.labelHidden "Language switch"
                }
            , Element.el
                  [ Element.padding 10
                  , Font.color fontColor
                  ]
                  (Element.text "FR")
            ]

            
