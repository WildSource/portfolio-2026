module Component exposing (..)

import Data.Message exposing (Msg (..))
import Theme exposing (Theme (..))
import Element exposing
    ( Attribute
    , DeviceClass (..)
    )


import Element.Border as Border

-- Conditional styling
addIf : Bool -> Attribute msg -> List (Attribute msg) -> List (Attribute msg)
addIf condition attribute baseAttributes  =
    if condition then
        attribute :: baseAttributes
    else
        baseAttributes

            
debugBorder : List (Attribute msg) -> List (Attribute msg)
debugBorder attributes =
    let
        debugBorderStyle =
            [ Border.width 2
            , Border.color (Element.rgb 1 0 0)
            ]
    in
        attributes ++ debugBorderStyle                  
        
