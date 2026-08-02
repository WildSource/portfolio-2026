module Theme exposing (..)

import Element exposing (Color)


type Theme
    = Light
    | Dark 
            
            
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
            
