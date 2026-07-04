module Components.Footer exposing (element)

import Element exposing
    ( Element
    , fill
    )
import Message exposing (Msg)
import Component exposing (debugBorder)

import Element.Background as Background
import Element.Font as Font
import Themes.GruvboxLight as GLight


element : Element Msg
element =
    let
        style =
            [ Element.padding 20
            , Element.width fill
            , Element.alignBottom
            , Background.color GLight.bg1
            ]
            
        copyright =
            Element.el
                [ Element.centerX
                , Font.color GLight.fg0
                , Font.size 15
                ]
                (Element.text "© 2026 Samuel Nguyen-Phok. All rights reserved.")
    in
        Element.el
            style
            (copyright)
            
