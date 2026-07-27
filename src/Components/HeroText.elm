module Components.HeroText exposing (element)

import Data.Model exposing (Config)
import Data.Message exposing (Msg (..))
import Theme exposing (Theme (..))
import Data.Translation exposing (Language)
import Element exposing
    ( Element
    , DeviceClass (..)
    )

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark
import Element.Font as Font
import Data.Translation as T


element : Config -> Element Msg
element ({ theme, language, device } as config) =
    let
        name =
            Element.el
                [ Theme.evalTheme
                        (Font.color GDark.blueLight)
                        (Light, Font.color GLight.blueDark)
                        theme                 
                ]
                (Element.text "Samuel Nguyen-Phok")
                

        heroText =
            Element.el
                [ Theme.evalTheme
                      (Font.color GDark.greenLight)
                      (Light, Font.color GLight.greenDark)
                      theme
                ]
                (Element.text (T.translate T.lastThirdHeroTitle language))
            

        spacingStyle =
            [ Element.padding 10
            , Element.spacing 20
            ]

        paragraphStyle =
            let
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
            in
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
            , subHeroTitle config
            ]


-- TODO regroup subHeroTitles into a single exportable list
subHeroTitle : Config -> Element Msg
subHeroTitle { theme, language } =
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
    
    
