module Components.Highlight exposing (element)

import Data.Message exposing (Msg)
import Element exposing (Element)
import Theme exposing (Theme (..))

import Element.Border as Border
import Element.Background as Background
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark

element : Theme -> String -> Element Msg
element theme content =
    let
        borderColor =
            case theme of
                Dark  -> GDark.orangeLight


                Light -> GLight.orangeLight

        backgroundColor =
            case theme of
                Dark  -> GDark.bg1

                         
                Light -> GLight.bg1

    in
        Element.el
            [ Border.width 3
            , Border.color borderColor
            , Border.rounded 15
            , Background.color backgroundColor
            , Element.padding 10
                
            ]
        (Element.text content)
