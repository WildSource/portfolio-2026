module Translation exposing (..)

type Language
    = EN
    | FR

      
type alias Translation =
    { en : String
    , fr : String
    }

    
translate : Translation -> Language -> String
translate translation language =
    if language == FR then
        translation.fr
    else
        translation.en

            
helloWorld : Translation
helloWorld =
    { en = "Hello World !"
    , fr = "Bonjour Monde !"
    }
    
