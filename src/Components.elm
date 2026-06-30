module Components exposing (..)

import Element exposing (Element)
import Translation exposing (Language)
import Translation as T
import Message exposing (Msg)

heroTitle : Language -> Element Msg
heroTitle language =
    let
        content =
            { en = "Hi, I'm Samuel Nguyen-Phok and I make websites"
            , fr = "Bonjour, je m'appelle Samuel Nguyen-Phok et je fais des sites webs"
            }
    in
        Element.el
            []
            (Element.text (T.translate content language))
                
