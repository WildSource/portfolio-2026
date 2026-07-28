module Components.Card exposing (element)

import Data.Message exposing (Msg)
import Utils exposing (debugBorder)
import Theme exposing
    ( Theme (..)
    , evalTheme
    )
import Data.Translation exposing
    ( Translation
    , translate
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
    Element.column
        [ Element.spacing 10
        , Element.width fill
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
                title
                language
                        
        fontColor =
            evalTheme
                GDark.blueLight
                (Light, GLight.blueDark)
                theme                                
    in
        Element.el
            [ Font.color fontColor
            , Font.bold
            , Font.size 20
            , Font.family [Font.typeface "Josefin Sans"]
            ]
        (Element.text text)    
