module Components.HeroText exposing (element)

import Utils exposing (debugBorder)
import Data.Message exposing (Msg (..))
import Theme exposing (Theme (..))
import Data.Translation exposing (Language)
import Element exposing
    ( Element
    , Device
    , DeviceClass (..)
    )

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark
import Element.Font as Font
import Data.Translation as T


element : Theme -> Language -> Device -> Element Msg
element theme language device =
    let
        name =
            let
                style =
                    Theme.evalTheme
                        (Font.color GDark.blueLight)
                        (Light, Font.color GLight.blueDark)
                        theme
            in
                Element.el [style] (Element.text "Samuel Nguyen-Phok")

        heroText =
            let
                style =
                    Theme.evalTheme
                        (Font.color GDark.greenLight)
                        (Light, Font.color GLight.greenDark)
                        theme
            in
                Element.el
                [ style ]
                ( Element.text
                      (T.translate T.lastThirdHeroTitle language)
                )
                    
        fontStyle =
            [ Font.family [Font.typeface "Josefin Sans"]
            , Font.heavy
            , Font.center
            ]
            
        themeStyle =
            Theme.evalTheme
                [Font.color GDark.fg0]
                (Light, [Font.color GLight.fg0])
                theme
            
        deviceStyle =
            case device.class of
                Phone ->
                    [Font.size 20]
                _ ->
                    [Font.strike]

        spacingStyle =
            [ Element.paddingXY 0 40
            , Element.spacing 20
            ]

        paragraphStyle =
            fontStyle ++ deviceStyle ++ themeStyle
    in
        Element.column
            spacingStyle
            [ Element.paragraph
                  paragraphStyle
                  [ Element.text
                        (T.translate T.firstThirdHeroTitle language)
                  , name
                  , Element.text
                        (T.translate T.secondThirdHeroTitle language)
                  , heroText
                  ]
            , subHeroTitle theme language
            ]


subHeroTitle : Theme -> Language -> Element Msg
subHeroTitle theme language=
    let
        fontColor =
            Theme.evalTheme
                GDark.yellowLight
                (Light, GLight.yellowDark)
                theme                
                    
        text1 =
            Element.el
                [Element.centerX]
                (Element.text (T.translate T.subHeroTitle1 language))
                    
        text2 =
            Element.el
                [Element.centerX]
                (Element.text (T.translate T.subHeroTitle2 language))
                    
        text3 =
            Element.el
                [Element.centerX]
                (Element.text (T.translate T.subHeroTitle3 language))
    in
        Element.column
            [ Element.paddingXY 10 0
            , Element.width Element.fill
            , Font.size 15
            , Font.center
            , Font.color fontColor
            , Font.semiBold
            , Font.family
                [Font.serif]
            ]
        [ text1
        , text2
        , text3
        ]
    
    
