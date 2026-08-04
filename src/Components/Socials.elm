module Components.Socials exposing (element)

import Element exposing
    ( Element
    , Device
    , fill
    )
import Data.Message exposing (Msg)
import Theme exposing (Theme (..))
import Utils exposing (debugBorder)

iconsPath : String
iconsPath = "/assets/icons/"            

element : Theme -> Device -> Element Msg
element theme _ =
    let
        githubLogo =
            case theme of
                Dark  -> "GitHub_Invertocat_White.svg"


                Light -> "GitHub_Invertocat_Black.svg"
                    
        linkedinLogo =
            case theme of
                Dark  -> "InBug-White.png"

                Light -> "LI-In-Bug.png"

        githubImage =
            { url = "https://github.com/WildSource"
            , imgSrc = iconsPath ++ githubLogo
            , imgDesc = "Clickable GitHub Invertocat Black Logo"
            }

        gmailImage =
            { url = "mailto:samuelnguyenphok@gmail.com"
            , imgSrc = iconsPath ++ "google_mail_gmail_logo_icon.svg"
            , imgDesc = "Clickable Gmail Logo"
            }

        linkedInImage =
            { url = "https://www.linkedin.com/in/samuel-nguyen-phok-99424225b/"
            , imgSrc = iconsPath ++ linkedinLogo
            , imgDesc = "Clickable LinkedIn Logo"
            }
    in
        Element.row
            [ Element.spacing 40
            , Element.paddingXY 30 10
            , Element.centerX
            ]
            [ social githubImage
            , social gmailImage
            , social linkedInImage
            ]

social : { url : String, imgSrc : String, imgDesc : String } -> Element Msg
social { url, imgSrc, imgDesc } =
    Element.link []
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
