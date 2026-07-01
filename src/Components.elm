module Components exposing (..)

import Element exposing
    ( Element
    , Device
    , DeviceClass (..)
    )
import Element.Font as Font
import Element.Input as Input
import Element.Background as Background
import Element.Border as Border

import Translation exposing (Language)
import Translation as T

import Message exposing (Msg (..))

import Model exposing (Model)

import Theme.Types as Type

      
themeSlider : Model -> Element Msg
themeSlider model =
    let
        checked = Type.toBool model.theme

        -- Gruvbox Light
        sliderOff : Element Msg
        sliderOff =
            Element.el
                [ Border.rounded 15
                , Element.moveRight 5
                , Element.width (Element.px 50)
                , Element.height (Element.px 30)
                , Background.color (Element.rgb255 146 131 116)
                , Element.inFront (
                           Element.el
                               [ Border.rounded 20
                               , Element.centerY
                               , Element.moveRight 5
                               , Element.width (Element.px 20)
                               , Element.height (Element.px 20)
                               , Background.color (Element.rgb255 60 56 54)
                               ]
                               (Element.none)
                          )
                ]
                (Element.none)

        sliderOn : Element Msg
        sliderOn =
            Element.el
                [ Border.rounded 15
                , Element.moveRight 5
                , Element.width (Element.px 50)
                , Element.height (Element.px 30)
                , Background.color (Element.rgb255 146 131 116)
                , Element.inFront (
                                   Element.el
                                       [ Border.rounded 20
                                       , Element.centerY
                                       , Element.alignRight
                                       , Element.moveLeft 5
                                       , Element.width (Element.px 20)
                                       , Element.height (Element.px 20)
                                       , Background.color (Element.rgb255 235 219 178)
                                       ]
                                       (Element.none)
                                  )
                ]
            (Element.none)
    in
        Input.checkbox
            []
            { onChange = (\ isChecked -> ThemeSwitch isChecked)
            , icon = (\ isChecked -> if isChecked then sliderOn else sliderOff)
            , checked = checked
            , label = Input.labelAbove [] (Element.text "Theme")
            }

        
heroTitle : Language -> Device -> Element Msg
heroTitle language device =
    let
        content =
            { en = "Hi, I'm Samuel Nguyen-Phok and I make websites"
            , fr = "Bonjour, je m'appelle Samuel Nguyen-Phok et je fais des sites webs"
            }
        deviceStyle =
            case device.class of
                Phone ->
                    Font.color (Element.rgb 1 0 0)

                Tablet ->
                    Font.color (Element.rgb 0 1 0)

                Desktop ->
                    Font.color (Element.rgb 0 0 1)

                BigDesktop ->
                    Font.color (Element.rgb 0 0 0)
    in
        Element.el
            [deviceStyle]
            (Element.text (T.translate content language))
                
