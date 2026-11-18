module Data.Skill exposing (..)


type alias Skill =
    { title : String
    , category : SkillCategory
    }

    
type SkillCategory
    = Language
    | LibraryFramework    

      
skills : List Skill
skills =
    [ haskell
    , java
    , elm
    , php
    , javascript
    , typescript
    , html
    , css
    , springBoot
    , scotty
    , servant
    , react
    , angular
    ]

    
haskell : Skill
haskell =    
    { title = "Haskell"
    , category = Language
    }


java : Skill
java =        
    { title = "Java"
    , category = Language
    }

    
elm : Skill
elm =       
    { title = "Elm"
    , category = Language
    }


php : Skill
php =
    { title = "Php"
    , category = Language
    }

    
javascript : Skill
javascript =
    { title = "Javascript"
    , category = Language
    }


typescript : Skill
typescript = 
    { title = "Typescript"
    , category = Language
    }


html : Skill
html = 
    { title = "Html"
    , category = Language
    }
    
    
css : Skill
css = 
    { title = "CSS"
    , category = Language
    }
    

springBoot : Skill
springBoot =             
    { title = "SpringBoot"
    , category = LibraryFramework
    }


scotty : Skill
scotty =         
    { title = "Scotty"          
    , category = LibraryFramework
    }


servant : Skill
servant =          
    { title = "Servant"
    , category = LibraryFramework
    }


react : Skill
react =         
    { title = "React"
    , category = LibraryFramework
    }

    
angular : Skill
angular =           
    { title = "Angular"
    , category = LibraryFramework
    }
    
