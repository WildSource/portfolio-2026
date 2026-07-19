module Theme exposing (..)

import Element exposing (Color)

type Theme
    = Light -- value = false (default)
    | Dark -- value = true

{-
This function abstracts the resolution of a binary theme.
It takes a left value (usually an Element.Color)
, a tuple consisting of the default theme plus a right value
and the theme to be evaluated (usually from the model).

The left and right values are usually colors.
The theme value in the tuple indicates the value the provided theme has to match and returns the right color in that tuple otherwise it's the other theme and we return the left color. (Hence, a binary theme. A value with only 2 themes)
 -} 
evalTheme : a -> (Theme, a) -> Theme -> a
evalTheme left (defaultTheme, right) theme =
    if theme == defaultTheme then
        right
    else
        left
            
            
toBool : Theme -> Bool
toBool theme =
    if theme == Light then
        False
    else
        True

         
fromBool : Bool -> Theme
fromBool bool =
    if bool then
        Dark
    else
        Light
            
