module Utils exposing (..)

import Element exposing (Attribute)
import Element.Border as Border

debugBorder : List (Attribute msg) -> List (Attribute msg)
debugBorder attributes =
    let
        debugBorderStyle =
            [ Border.width 2
            , Border.color (Element.rgb 1 0 0)
            ]
    in
        attributes ++ debugBorderStyle

intersperse : a -> List a -> List a
intersperse element elements =
    case (element, elements) of
        ( _, [] ) ->
            []
        (el, (x :: xs)) ->
            x :: el :: intersperse element xs
        
