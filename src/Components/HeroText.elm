module Components.HeroText exposing (element)

import Utils exposing (debugBorder)

import Data.Model exposing (Config)
import Data.Message exposing (Msg (..))
import Theme exposing (Theme (..))
import Element exposing
    ( Element
    , DeviceClass (..)
    , Orientation (..)
    , centerX
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
            , Element.centerX
            ]

        scalingStyle =
            case (device.class, device.orientation) of
                (Tablet, Portrait) -> [ Font.size 30 ]
                    
                    
                (Tablet, Landscape) -> [ Font.size 30]

                                       
                _ -> []

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
                    case (device.class, device.orientation) of
                        (Phone, Portrait) -> [ Font.size 20 ]

                                             
                        (Phone, Landscape) -> [ Font.size 30 ]

                                              
                        (Tablet, Portrait) -> [ Font.size 30 ]

                                               
                        (Tablet, Landscape) -> [ Font.size 40 ]

                                               
                        (Desktop, _) -> [ Font.size 60 ]

                                        
                        (BigDesktop, _) -> [ Font.size 100 ]
                                           
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
        Element.column (spacingStyle ++ scalingStyle)
            [ heroTitle
            , subHeroTitle config
            ]


subHeroTitle : Config -> Element Msg
subHeroTitle { theme, language, device } =
    let
        fontColor =
            case theme of
                Dark  -> GDark.yellowLight

                         
                Light -> GLight.yellowDark

        fontScale =
            case (device.class, device.orientation) of
                (Phone, Portrait) -> 15

                                     
                (Phone, Landscape) -> 25

                                      
                (Tablet, Portrait) -> 22

                                      
                (Tablet, Landscape) -> 30

                                       
                (Desktop, _) -> 40

                                        
                (BigDesktop, _) -> 50

        content =  T.subHeroTitle
                |> List.map (T.translate language)
                |> List.map (Element.text)
                |> List.map (Element.el [ Element.centerX ])           
    in
        Element.column
            [ Element.paddingXY 10 0
            , Element.width Element.fill
            , Font.size fontScale
            , Font.center
            , Font.color fontColor
            , Font.semiBold
            , Font.family [Font.serif]
            ]
        content
    
    
