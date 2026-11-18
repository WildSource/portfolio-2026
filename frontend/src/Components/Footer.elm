module Components.Footer exposing (element)

import Element exposing
    ( Element
    , fill
    )
import Data.Message exposing (Msg)
import Data.Model exposing (Model)
import Theme exposing (Theme (..))

import Element.Background as Background
import Element.Font as Font
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


element : Theme -> Element Msg
element theme =
    let
        footerColor =
            case theme of
                Dark  -> GDark.bg1

                         
                Light -> GLight.bg1

        fontColor =
            case theme of
                Dark  -> GDark.fg0

                         
                Light -> GLight.fg0
                    
        style =
            [ Element.padding 20
            , Element.width fill
            , Element.alignBottom
            , Background.color footerColor
            ]
            
        copyright =
            Element.el
                [ Element.centerX
                , Font.color fontColor
                , Font.size 15
                ]
                (Element.text "© 2026 Samuel Nguyen-Phok. All rights reserved.")
    in
        Element.el
            style
            (copyright)
            
