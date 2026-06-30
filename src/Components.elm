module Components exposing (..)

import Element exposing
    ( Element
    , Device
    , DeviceClass (..)
    )
import Element.Font as Font
import Translation exposing (Language)
import Translation as T
import Message exposing (Msg)

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
                    Font.color (Element.rgb 1 1 1)
    in
        Element.el
            [deviceStyle]
            (Element.text (T.translate content language))
                
