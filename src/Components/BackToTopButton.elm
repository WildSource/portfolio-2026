module Components.BackToTopButton exposing (element)

import Element exposing
    ( Element
    , px
    )
import Data.Message exposing (Msg)

import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Themes.GruvboxDark as GDark
import Themes.GruvboxLight as GLight


element : Element Msg
element =
    let
        responsiveSize = px 100

        themeColor = GLight.fg2
    in
        Input.button []
            { onPress = Nothing
            , label = Element.text ""
            }
            
