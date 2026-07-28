module Theme exposing (..)

import Element exposing (Color)


type Theme
    = Light
    | Dark 

      
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
            
