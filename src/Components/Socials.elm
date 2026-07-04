module Components.Socials exposing (element)

import Component

import Element exposing
    ( Element
    , fill
    )
import Message exposing (Msg)

iconsPath : String
iconsPath = "/assets/icons/"            

element : Element Msg
element =
    Element.row
        (Component.debugBorder
             [ Element.width fill
             , Element.spacing 10
             , Element.padding 20
             ]
        )
        [social
             "https://github.com/WildSource"
             (iconsPath ++ "GitHub_Invertocat_Black.svg")
             "GitHub Invertocat Black Logo"
        ]

social : String -> String -> String -> Element Msg
social url imgSrc imgDesc=
    Element.link
        []
        { url = url
        , label =
            Element.image
                []
                { src = imgSrc
                , description = imgDesc
                }
        }
