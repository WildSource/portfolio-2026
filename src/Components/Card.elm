module Components.Card exposing (element)

import Data.Message exposing (Msg)
import Data.Model exposing (Model)
import Theme exposing (Theme (..))
import Data.Translation exposing
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


element
    :  Theme
    -> Language
    -> Translation
    -> Element Msg
    -> Element Msg    
element theme language title content =
    let
        titleText =
            let
                text =
                    if language == EN then
                        title.en
                    else
                        title.fr
                            
                fontColor =
                    if theme == Light then
                        GLight.blueDark
                    else
                        GDark.blueLight
            in
                Element.el
                    [ Font.color fontColor
                    , Font.bold
                    , Font.size 20
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
    
