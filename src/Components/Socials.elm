module Components.Socials exposing (element)

import Element exposing
    ( Element
    , Device 
    , DeviceClass (..)
    , fill
    )
import Data.Message exposing (Msg)
import Theme exposing (Theme (..))

iconsPath : String
iconsPath = "/assets/icons/"            

element : Theme -> DeviceClass -> Element Msg
element theme deviceClass =
    let
        responsiveSpacing =
            case deviceClass of
                Desktop -> 150

                           
                BigDesktop -> 400

                              
                _ -> 40

        responsivePaddingY =
            case deviceClass of
                Desktop -> 50

                           
                BigDesktop -> 100

                              
                _ -> 10

    in
        Element.row
            [ Element.spacing responsiveSpacing
            , Element.paddingXY 30 responsivePaddingY 
            , Element.centerX
            ]
            (loadImages theme deviceClass)

loadImages : Theme -> DeviceClass -> List (Element Msg)
loadImages theme deviceClass =
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

        logos =
            [ githubImage
            , gmailImage
            , linkedInImage
            ]
    in
        List.map (social deviceClass) logos
    

social : DeviceClass -> { url : String, imgSrc : String, imgDesc : String } ->  Element Msg
social deviceClass { url, imgSrc, imgDesc }  =
    let
        imgSize =
            case deviceClass of
                Desktop -> Element.px 150

                           
                BigDesktop -> Element.px 200

                              
                _ -> Element.px 80
    in
        Element.link []
            { url = url
            , label =
                Element.image
                    [ Element.width imgSize
                    , Element.height imgSize
                    ]
                { src = imgSrc
                , description = imgDesc
                }
            }
