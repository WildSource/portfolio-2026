module Theme.GruvboxDark exposing (..)

import Element exposing (Color)

-- Base colors (row 1, normal)
bg : Color
bg = Element.rgb255 40 40 40

     
fg : Color
fg = Element.rgb255 235 219 178

     
-- ANSI hues — duplicated across normal/bright rows, disambiguated
redDark : Color
redDark = Element.rgb255 204 36 29

          
redLight : Color
redLight = Element.rgb255 251 73 52

           
greenDark : Color
greenDark = Element.rgb255 152 151 26

            
greenLight : Color
greenLight = Element.rgb255 184 187 38

             
yellowDark : Color
yellowDark = Element.rgb255 215 153 33

             
yellowLight : Color
yellowLight = Element.rgb255 250 189 47

              
blueDark : Color
blueDark = Element.rgb255 69 133 136

           
blueLight : Color
blueLight = Element.rgb255 131 165 152

            
purpleDark : Color
purpleDark = Element.rgb255 177 98 134

             
purpleLight : Color
purpleLight = Element.rgb255 211 134 155

              
aquaDark : Color
aquaDark = Element.rgb255 104 157 106

           
aquaLight : Color
aquaLight = Element.rgb255 142 192 124

            
grayLight : Color
grayLight = Element.rgb255 168 153 132

            
grayDark : Color
grayDark = Element.rgb255 146 131 116

           
-- Background ramp (row 3)
bg0Hard : Color
bg0Hard = Element.rgb255 29 32 33

          
bg0 : Color
bg0 = Element.rgb255 40 40 40

      
bg1 : Color
bg1 = Element.rgb255 60 56 54

      
bg2 : Color
bg2 = Element.rgb255 80 73 69

      
bg3 : Color
bg3 = Element.rgb255 102 92 84

      
bg4 : Color
bg4 = Element.rgb255 124 111 100

      
-- Foreground ramp (row 4)
bg0Soft : Color
bg0Soft = Element.rgb255 50 48 47

          
fg4 : Color
fg4 = Element.rgb255 168 153 132

      
fg3 : Color
fg3 = Element.rgb255 189 174 147

      
fg2 : Color
fg2 = Element.rgb255 213 196 161

      
fg1 : Color
fg1 = Element.rgb255 235 219 178

      
fg0 : Color
fg0 = Element.rgb255 251 241 199

      
-- Orange — no ANSI slot, but still appears twice
orangeDark : Color
orangeDark = Element.rgb255 214 93 14

             
orangeLight : Color
orangeLight = Element.rgb255 254 128 25
              
