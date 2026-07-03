module Components.HeroText exposing (element)

import Model exposing (Model)
import Message exposing (Msg (..))
import Theme exposing (Theme (..))
import Element exposing
    ( Element
    , DeviceClass (..)
    )

import Themes.GruvboxLight as GLight
import Themes.GruvboxDark as GDark
import Element.Font as Font
import Translation as T


element : Model -> Element Msg
element model =
    let
        name =
            let
                style =
                    if model.theme == Light then
                        Font.color GLight.blueDark
                    else
                        Font.color GDark.blueLight                    
            in
                Element.el [style] (Element.text "Samuel Nguyen-Phok")

        heroText =
            let
                style =
                    if model.theme == Light then
                        Font.color GLight.greenDark
                    else
                        Font.color GDark.greenLight
            in
                Element.el
                [style]
                (Element.text (T.translate T.lastThirdHeroTitle model.locale))
                    
        fontStyle =
            [ Font.family [Font.typeface "Josefin Sans"]
            , Font.heavy
            , Font.center
            ]
            
        themeStyle =
            if model.theme == Light then
                [Font.color GLight.fg0]
            else
                [Font.color GDark.fg0]
            
        deviceStyle =
            case model.device.class of
                Phone ->
                    [Font.size 30]
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
                          [ Element.text (T.translate T.firstThirdHeroTitle model.locale)
                          , name
                          , Element.text (T.translate T.secondThirdHeroTitle model.locale)
                          , heroText
                          ]
            , subHeroTitle model
            ]


subHeroTitle : Model -> Element Msg
subHeroTitle model =
    let
        text1 =
            Element.el
                [Element.centerX]
                (Element.text (T.translate T.subHeroTitle1 model.locale))
        text2 =
            Element.el
                [Element.centerX]
                (Element.text (T.translate T.subHeroTitle2 model.locale))
        text3 =
            Element.el
                [Element.centerX]
                (Element.text (T.translate T.subHeroTitle3 model.locale))
    in
        Element.column
            [ Element.paddingXY 10 0
            , Element.width Element.fill
            , Font.size 15
            , Font.center
            , Font.color (GLight.yellowDark)
            , Font.semiBold
            , Font.family
                [ Font.serif]
            ]
        [ text1
        , text2
        , text3
        ]
    
    
