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
        label =
            { en = "Theme"
            , fr = "Thème"
            }

        translatedLabel = Element.text (T.translate label model.locale)
            
        checked =
            Type.toBool model.theme
                
        sliderOn =
            slider ({ model | theme = Type.Dark }) True
                
        sliderOff =
            slider ({ model | theme = Type.Light }) False
    in
        Input.checkbox
            []
            { onChange = (\ isChecked -> ThemeSwitch isChecked)
            , icon = (\ isChecked -> if isChecked then sliderOn else sliderOff)
            , checked = checked
            , label = Input.labelAbove [] translatedLabel
            }

            
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
        content =
            { en = "Hi, I'm Samuel Nguyen-Phok \nand I make websites."
            , fr = "Bonjour, je m'appelle Samuel Nguyen-Phok et je fais des sites webs"
            }

        fontStyle =
            Font.family [Font.typeface "Josefin Sans"]
            
        themeStyle =
            if model.theme == Type.Light then
                Font.color GLight.fg0
            else
                Font.color GDark.fg0
            
        deviceStyle =
            case model.device.class of
                Phone ->
                    Font.size 50
                _ ->
                    Font.strike
    in
        Element.el
            [ deviceStyle
            , themeStyle
            , fontStyle
            ]
            ( Element.text (T.translate content model.locale) )
                
