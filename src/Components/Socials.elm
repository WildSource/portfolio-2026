module Components.Socials exposing (element)

import Component

import Element exposing
    ( Element
    , fill
    )
import Data.Message exposing (Msg)
import Data.Model exposing (Model)
import Theme exposing (Theme (..))

iconsPath : String
iconsPath = "/assets/icons/"            

element : Model -> Element Msg
element model =
    let
        githubLogo =
            if model.theme == Light then
                "GitHub_Invertocat_Black.svg"
            else
                "GitHub_Invertocat_White.svg"
                    
        linkedinLogo =
            if model.theme == Light then
                "LI-In-Bug.png"
            else
                "InBug-White.png"
    in
        Element.row
            [ Element.width fill
            , Element.spacing 40
            , Element.paddingXY 30 10
            ]
            [ social
                  "https://github.com/WildSource"
                  (iconsPath ++ githubLogo)
                  "Clickable GitHub Invertocat Black Logo"
            , social
                  "mailto:samuelnguyenphok@gmail.com"
                  (iconsPath ++ "google_mail_gmail_logo_icon.svg")
                  "Clickable Gmail Logo"
            , social
                  "https://www.linkedin.com/in/samuel-nguyen-phok-99424225b/"
                  (iconsPath ++ linkedinLogo)
                  "Clickable LinkedIn Logo"
            ]

social : String -> String -> String -> Element Msg
social url imgSrc imgDesc=
    Element.link
        []
        { url = url
        , label =
            Element.image
                [ Element.width (Element.px 80)
                , Element.height (Element.px 80)
                ]
                { src = imgSrc
                , description = imgDesc
                }
        }
