module Main exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Browser
import Browser.Navigation as Nav

main : Html msg
main = 
  div [ class "main-container" ]
  [ div [ class "left" ] 
    [ div [ id "menu-title" ] [ text "Menu" ]

    -- TODO: Add expand class on click for (+)
    -- TODO: Add "visible" tag on click (+)
    -- TODO: Add hover properties for menu items
    -- TODO: Add expanded menu items in order
    , div [ id "preprocessor", class "menu-item" ] [ text "(+) Preprocessor" ] 
    , div [ id "solution", class "menu-item" ] [ text "(+) Solution" ]
    , div [ id "postprocessor", class "menu-item" ] [ text "(+) Postprocessor" ]
    , div [ id "save", class "menu-item" ] [ text "Save" ]
    ]

  , div [ class "right" ] 
    [ div [ id "fem-title" ] [ text "FEM ANALYSIS" ]
    ]
  ]
