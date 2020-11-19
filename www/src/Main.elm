module Main exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)

main : Html msg
main = 
  div [ class "main-container" ]
  [ div [ class "left" ] 
    [ div [ id "menu-title" ] [ text "Menu" ]
    ]

  , div [ class "right" ] 
    [ div [ id "fem-title" ] [ text "FEM ANALYSIS" ]
    ]
  ]
