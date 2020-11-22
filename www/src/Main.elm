module Main exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Browser
import Browser.Navigation as Nav
import Url
import Browser.Dom exposing (getElement)


main : Program () Model Msg
main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


-- MODEL

type alias Model = 
  { val: Int }

init : () -> ( Model, Cmd Msg )
init _ =
  (Model 1, Cmd.none)


-- UPDATE

type Msg = ExpandPre | Collaspe

update : Msg -> Model -> (Model,Cmd Msg)
update msg model =
  case msg of
    ExpandPre ->
      

  (model,Cmd.none)


-- VIEW

view : Model -> Html Msg
view model =
  main_page
  -- div []
  --   [ button [ onClick Decrement ] [ text "-" ]
  --   , div [] [ text (String.fromInt model) ]
  --   , button [ onClick Increment ] [ text "+" ]
  --   ]


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


main_page :Html Msg
main_page = 
  div [ class "main-container" ]
  [ div [ class "left" ] 
    [ div [ id "menu-title" ] [ text "Menu" ]

    -- TODO: Add expand class on click for (+)
    -- TODO: Add "visible" tag on click (+)
    -- TODO: Add hover properties for menu items
    -- TODO: Add expanded menu items in order

    --   [ button [ onClick Decrement ] [ text "-" ]

    , div [ id "preprocessor", class "menu-item" ] [ button [ onClick ExpandPre] [text "(+) Preprocessor" ] ]
    , div [ id "mat-props", class "menu-item" ] [ text "(+) Material Properties" ]
    , div [ id "solution", class "menu-item" ] [ text "(+) Solution" ]
    , div [ id "postprocessor", class "menu-item" ] [ text "(+) Postprocessor" ]
    , div [ id "save", class "menu-item" ] [ text "Save" ]
    ]

  , div [ class "right" ] 
    [ div [ id "fem-title" ] [ text "FEM ANALYSIS" ]
    ]
  ]


mat_props : Html msg
mat_props =
  div [ id "mat-props", class "menu-item" ] [ text "(+) Material Properties" ]


