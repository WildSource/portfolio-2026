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
    { en = "websites\n"
    , fr = "sites webs\n"
    }

    
subHeroTitle1 : Translation
subHeroTitle1 =
    { en = "I'm a fullstack developer"
    , fr = "Je suis un dévelopeur fullstack"
    }

    
subHeroTitle2 : Translation
subHeroTitle2 =
    { en = " a.k.a. "
    , fr = " c'est-à-dire "
    }

subHeroTitle3 : Translation
subHeroTitle3 =
    { en = "backend dev that can do frontend dev"
    , fr = "un dev backend qui peut faire du frontend"
    }        
    

aboutTitle : Translation
aboutTitle =
    { en = "About me"
    , fr = "À propos de moi"
    }

    
aboutContent : Translation
aboutContent =
    { en = "Content about me"
    , fr = "Contenu sur moi"
    }

    
experiencesTitle : Translation
experiencesTitle =
    { en = "My experiences"
    , fr = "Mes expériences"
    }

    
experiencesContent : Translation
experiencesContent =
    { en = "Content on my experiences"
    , fr = "Contenu sur mes expériences"
    }

    
technologyTitle : Translation
technologyTitle =
    { en = "Technologies"
    , fr = "Technologies"
    }

    
technologyContent : Translation
technologyContent =
    { en = "Content on technologies"
    , fr = "Contenu sur les technologies"
    }

projectsTitle : Translation
projectsTitle =
    { en = "Projects"
    , fr = "Projets"
    }

projectsContent : Translation
projectsContent =
    { en = "Content about my projects"
    , fr = "Contenu sur mes projets"
    }
                
