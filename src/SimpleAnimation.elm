module SimpleAnimation exposing
    ( mkGenericAnimatedUi
    , animatedElementWrapper
    )

import Element exposing (Element)
import Simple.Animation.Animated

import Simple.Animation exposing (Animation)
import Simple.Animation.Animated exposing (UiOptions)


-- Takes in a Element constructor (el, column, etc...)
mkGenericAnimatedUi =
    Simple.Animation.Animated.ui
        { behindContent = Element.behindContent
        , htmlAttribute = Element.htmlAttribute
        , html = Element.html
        }

animatedElementWrapper
    :  Animation
    -> List (Element.Attribute msg)
    -> Element msg
    -> Element msg
animatedElementWrapper =
    mkGenericAnimatedUi Element.el
    
