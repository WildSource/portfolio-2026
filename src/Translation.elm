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

            
{-
Translations (better to store them in a seperate file out of elm code but,
for the size of this project it's fine)
-}


firstThirdHeroTitle : Translation
firstThirdHeroTitle =
    { en = "Hi, I'm "
    , fr = "Bonjour, je m'appelle "
    }

    
secondThirdHeroTitle : Translation
secondThirdHeroTitle =
    { en = " and I make "
    , fr = " et je fais des "
    }

    
lastThirdHeroTitle : Translation
lastThirdHeroTitle =
    { en = "websites."
    , fr = "sites webs."
    }
    
