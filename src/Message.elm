module Message exposing (..)

type alias WindowSize =
    { width : Int
    , height : Int        
    }

type Msg
    = None
    | WindowResize WindowSize
    | ThemeSwitch Bool
    | LanguageSwitch Bool
    | ToggleDropdown String
      
