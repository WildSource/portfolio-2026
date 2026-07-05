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
        [ Element.width fill
        , Element.spacing 40
        , Element.paddingXY 30 10
        ]
        [ social
              "https://github.com/WildSource"
              (iconsPath ++ "GitHub_Invertocat_Black.svg")
              "Clickable GitHub Invertocat Black Logo"
        , social
              "mailto:samuelnguyenphok@gmail.com"
              (iconsPath ++ "google_mail_gmail_logo_icon.svg")
              "Clickable Gmail Logo"
        ]

social : String -> String -> String -> Element Msg
social url imgSrc imgDesc=
    Element.link
        []
        { url = url
        , label =
            Element.image
                [ Element.width (Element.px 60)
                , Element.height (Element.px 60)
                ]
                { src = imgSrc
                , description = imgDesc
                }
        }
