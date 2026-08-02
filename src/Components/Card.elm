module Components.Card exposing (element)

import Data.Message exposing (Msg)
import Utils exposing (debugBorder)
import Theme exposing ( Theme (..))
import Data.Translation exposing
    ( Translation
    , translate
    , Language (..)
    )
import Element exposing
    ( Element
    , width
    , spacing
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
    Element.column
        [ spacing 10
        , width fill
        ]        
        [ titleText theme language title
        , content
        ]
    
titleText
    :  Theme
    -> Language
    -> Translation
    -> Element Msg
titleText theme language title =
    let
        text =
            translate
                language
                title
                        
        fontColor =
            case theme of
                Dark -> GDark.blueLight

                        
                Light -> GLight.blueDark                                
    in
        Element.el
            [ Font.color fontColor
            , Font.bold
            , Font.size 20
            , Font.family [Font.typeface "Josefin Sans"]
            ]
        (Element.text text)    
