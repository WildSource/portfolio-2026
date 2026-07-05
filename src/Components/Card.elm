module Components.Card exposing (element)

import Message exposing (Msg)
import Model exposing (Model)
import Theme exposing (Theme (..))
import Translation exposing
    ( Translation
    , Language (..)
    )
import Element exposing
    ( Element
    , fill
    )

import Element.Font as Font
import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark


element : Model -> Translation -> Element Msg -> Element Msg    
element model title content =
    let
        titleText =
            let
                text =
                    if model.locale == EN then
                        title.en
                    else
                        title.fr
                            
                fontColor =
                    if model.theme == Light then
                        GLight.blueDark
                    else
                        GDark.blueLight
            in
                Element.el
                    [ Font.color fontColor
                    , Font.bold
                    , Font.family
                          [Font.typeface "Josefin Sans"]
                    ]
                    (Element.text text)
    in
        Element.column
            [ Element.padding 20
            , Element.spacing 10
            , Element.width fill
            ]
            [ titleText
            , content
            ]
    
