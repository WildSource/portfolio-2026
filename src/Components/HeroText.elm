module Components.HeroText exposing (element)

import Data.Model exposing (Config)
import Data.Message exposing (Msg (..))
import Theme exposing (Theme (..))
import Data.Translation exposing (Language)
import Element exposing
    ( Element
    , DeviceClass (..)
    , padding
    , spacing
    , width
    , fill
    )

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark
import Element.Font as Font
import Data.Translation as T


element : Config -> Element Msg
element ({ theme, language, device } as config) =
    let
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
                    case theme of
                        Dark  -> [Font.color GDark.fg0]

                                 
                        Light -> [Font.color GLight.fg0]
                                
                deviceStyle =
                    case device.class of
                        Phone ->
                            [Font.size 20]

                                
                        _     ->
                            [Font.strike]
            in
                fontStyle ++ deviceStyle ++ themeStyle

        heroTitle =
            let
                name =
                    Element.el
                        [ case theme of
                              Dark  -> Font.color GDark.blueLight
                              
                              
                              Light -> Font.color GLight.blueDark         
                        ]
                        (Element.text "Samuel Nguyen-Phok")
                
                heroText =
                    Element.el
                        [ case theme of
                              Dark  -> Font.color GDark.greenLight
                              
                              
                              Light -> Font.color GLight.greenDark 
                        ]
                        (Element.text (T.translate language T.lastHeroTitle))
                    
            in
                Element.paragraph paragraphStyle
                    [ Element.text
                          (T.translate language T.firstHeroTitle)
                    , name
                    , Element.text
                          (T.translate language T.secondHeroTitle)
                    , heroText
                    ]
    in
        Element.column spacingStyle
            [ heroTitle
            , subHeroTitle config
            ]


subHeroTitle : Config -> Element Msg
subHeroTitle { theme, language } =
    let
        fontColor =
            case theme of
                Dark  -> GDark.yellowLight

                         
                Light -> GLight.yellowDark

        content =  T.subHeroTitle
                |> List.map (T.translate language)
                |> List.map (Element.text)
                |> List.map (Element.el [ Element.centerX ])           
    in
        Element.column
            [ Element.paddingXY 10 0
            , Element.width Element.fill
            , Font.size 15
            , Font.center
            , Font.color fontColor
            , Font.semiBold
            , Font.family [Font.serif]
            ]
        content
    
    
