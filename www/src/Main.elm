module Main exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)

main : Html msg
main = 
  div [ class "main-container" ]
  [ div [ class "left" ] 
    [ div [ id "menu-title" ] [ text "Menu" ]

    -- TODO: Add expand class on click for (+)
    -- TODO: Add "visible" tag on click (+)
    -- TODO: Add hover properties for menu items
    , div [ id "preprocessor" ] [ text "(+) Preprocessor" ] 
    ]

  , div [ class "right" ] 
    [ div [ id "fem-title" ] [ text "FEM ANALYSIS" ]
    ]
  ]
