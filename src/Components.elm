module Components exposing (..)

import Element exposing
    ( Element
    , Attribute
    , DeviceClass (..)
    )
import Element.Font as Font
import Element.Input as Input
import Element.Background as Background
import Element.Border as Border

import Translation as T

import Message exposing (Msg (..))

import Model exposing (Model)

import Theme.Types as Type
import Theme.GruvboxLight as GLight
import Theme.GruvboxDark as GDark

import Icons

debugBorder : List (Attribute msg) -> List (Attribute msg)
debugBorder attributes =
    let
        debugBorderStyle =
            [ Border.width 2
            , Border.color (Element.rgb 1 0 0)
            ]
    in
        attributes ++ debugBorderStyle

-- Conditional styling
addIf : Bool -> Attribute msg -> List (Attribute msg) -> List (Attribute msg)
addIf condition attribute baseAttributes  =
    if condition then
        attribute :: baseAttributes
    else
        baseAttributes
    
      
themeSlider : Model -> Element Msg
themeSlider model =
    let            
        sliderOn =
            slider ({ model | theme = Type.Dark }) True
                
        sliderOff =
            slider ({ model | theme = Type.Light }) False
    in
        Element.row
            []
            [ Icons.sun 
            , Input.checkbox
                  []
                  { onChange = (\ isChecked -> ThemeSwitch isChecked)
                  , icon = (\ isChecked -> if isChecked then sliderOn else sliderOff)
                  , checked = Type.toBool model.theme
                  , label = Input.labelHidden "Theme switch"
                  }
            , Element.el [Element.padding 5] (Icons.moon model)
            ]


languageSlider : Model -> Element Msg
languageSlider model =
    let
        checked =
            if model.locale == T.EN then
                False
            else
                True

        sliderOn =
            slider model True

        sliderOff =
            slider model False                
    in
        Element.row
            [ Element.spacing 5 ]
            [ Element.text "EN"
            , Input.checkbox
                []
                { onChange = (\ isChecked -> LanguageSwitch isChecked)
                , icon = (\ isChecked -> if isChecked then sliderOn else sliderOff)
                , checked = checked
                , label = Input.labelHidden "Language switch"
                }
            , Element.el [Element.padding 10] (Element.text "FR")
            ]
            
            
slider : Model -> Bool -> Element Msg
slider model isSwitchedOn =
    let
        knobColor =
            if model.theme == Type.Light then
                GLight.fg
            else
                GDark.fg
                    
        knobPosition =
            if isSwitchedOn then
                Element.moveLeft 5                
            else
                Element.moveRight 5

        defaultKnobAttributes =
            [ Border.rounded 20
            , Element.centerY
            , knobPosition
            , Element.width (Element.px 20)
            , Element.height (Element.px 20)
            , Background.color knobColor
            ]

        knobAttributes =
            addIf isSwitchedOn Element.alignRight defaultKnobAttributes            
            
        knob =
            Element.el knobAttributes (Element.none)
    in
        Element.el
            [ Border.rounded 15
            , Element.moveRight 5
            , Element.width (Element.px 50)
            , Element.height (Element.px 30)
            , Background.color GLight.grayLight
            , Element.inFront knob              
            ]
        (Element.none)            

        
heroTitle : Model -> Element Msg
heroTitle model =
    let
        name =
            let
                style =
                    if model.theme == Type.Light then
                        Font.color GLight.blueDark
                    else
                        Font.color GDark.blueLight                    
            in
                Element.el [style] (Element.text "Samuel Nguyen-Phok")

        heroText =
            let
                style =
                    if model.theme == Type.Light then
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
            if model.theme == Type.Light then
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
    
    
