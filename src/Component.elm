module Component exposing (..)

import Data.Message exposing (Msg (..))
import Theme exposing (Theme (..))
import Element exposing
    ( Attribute
    , DeviceClass (..)
    )

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
        
