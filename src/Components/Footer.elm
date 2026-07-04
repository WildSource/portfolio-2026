module Components.Footer exposing (element)

import Element exposing
    ( Element
    , fill
    )
import Message exposing (Msg)
import Component exposing (debugBorder)
import Model exposing (Model)
import Theme exposing (Theme (..))

import Element.Background as Background
import Element.Font as Font
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


element : Model -> Element Msg
element model =
    let
        footerColor =
            if model.theme == Light then
                GLight.bg1
            else
                GDark.bg1

        fontColor =
            if model.theme == Light then
                GLight.fg0
            else
                GDark.fg0
                    
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
            
