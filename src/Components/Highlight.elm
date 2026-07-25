module Components.Highlight exposing (element)

import Data.Message exposing (Msg)
import Element exposing (Element)
import Theme exposing (Theme)

element : Theme -> String -> Element Msg
element theme content =
    Element.el
        []
        (Element.text content)
