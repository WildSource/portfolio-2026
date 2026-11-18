module Components.LanguageSlider exposing (element)

import Data.Model exposing (Config)
import Data.Message exposing (Msg (..))
import Element exposing (Element)
import Theme exposing (Theme (..))

import Element.Input as Input
import Element.Font as Font
import Data.Translation as T
import Components.Patterns.Slider as Slider
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


element : Config -> Element Msg
element { theme, language } =
    let
        fontColor =
            case theme of
                Dark  -> GDark.fg0


                Light -> GLight.fg0    

        checkbox =
            Input.checkbox []
                { onChange =
                      (\ isChecked -> LanguageSwitch isChecked)
                , icon =
                      (\ isChecked -> if isChecked then sliderOn else sliderOff)
                , checked = language == T.FR
                , label = Input.labelHidden "Language switch"
                }
                    
        sliderOn =
            Slider.element theme True

        sliderOff =
            Slider.element theme False

        englishLabel =
            Element.el [Font.color fontColor]
                (Element.text "EN")
                    
        frenchLabel =
            Element.el
                [ Element.padding 10
                , Font.color fontColor
                ]
                ( Element.text "FR" )
    in
        Element.row [ Element.spacing 5 ]
            [ englishLabel
            , checkbox
            , frenchLabel
            ]

            
