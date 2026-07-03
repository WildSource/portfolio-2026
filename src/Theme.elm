module Theme exposing (..)


type Theme
    = Light -- value = false (default)
    | Dark -- value = true

      
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
            
