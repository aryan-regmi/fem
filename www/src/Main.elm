module Main exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Browser
import Browser.Navigation as Nav
import Url
import Http exposing(..)
import Json.Decode exposing (list, string)
import Html.Events exposing (onSubmit)
import Browser.Navigation exposing (load)
import Html.Events exposing (onMouseEnter)


-- MAIN


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
  { mat_vis: String
  , expand_class: String
  , mat_prop: String
  }

init : () -> ( Model, Cmd Msg )
init _ =
  (Model "none" "" "none", Cmd.none)



-- UPDATE 

type Msg = ExpandPre
  | MatProps


update : Msg -> Model -> (Model,Cmd Msg)
update msg model =
  case msg of
    ExpandPre ->
      if model.mat_vis == "none" then
        ({model | mat_vis = "block", expand_class = "expand"}, Cmd.none)
      
      else
        ({model | mat_vis = "none", expand_class = ""}, Cmd.none)
  
    MatProps ->
      case model.mat_prop of
        "none" ->
          ({model | mat_prop = "block"}, Cmd.none)
        
        "block" ->
          ({model | mat_prop = "none"}, Cmd.none)

        _ ->
          (model, Cmd.none)
    


-- VIEW

view : Model -> Html Msg
view model =
  main_page model



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



main_page : Model -> Html Msg
main_page model = 
  div [ class "main-container" ]
  [ div [ class "left" ] 
    [ div [ id "menu-title" ] [ text "Menu" ]

    -- TODO: Add expand class on click for (+)
    -- TODO: Add "visible" tag on click (+)
    -- TODO: Add hover properties for menu items
    -- TODO: Add expanded menu items in order

    --   [ button [ onClick Decrement ] [ text "-" ]

    , div [ id "preprocessor", class "menu-item", class model.expand_class ]
        [ button [ id "preprocessor", class "menu-item"
                 , style "border-style" "none"
                 , onClick ExpandPre
                 , class model.expand_class 
                 ] 
              [ text "(+) Preprocessor" ] 
        ]
    , div [ id "mat-props", class "menu-item", style "display" model.mat_vis ]  --[ text "(+) Material Properties" ]
        [
          button 
            [ id "mat-prop-but", class "menu-item", style "border" "none", onClick MatProps ]
            [ text "(+) Material Properties" ]
        ]
    , div [ id "solution", class "menu-item" ] [ text "(+) Solution" ]
    , div [ id "postprocessor", class "menu-item" ] [ text "(+) Postprocessor" ]
    , div [ id "save", class "menu-item" ] [ text "Save" ]
    ]

  , div [ class "right" ] 
    [ div [ id "fem-title" ] [ text "FEM ANALYSIS" ] 
    , div [ id "form-cont", style "display" model.mat_prop ]
        [ Html.form [ id "matprop_form"
                    , action "http://localhost:8000/api/mat_mod"
                    , method "post"
                    ]
          [ label [ for "youngs-mod" ] [ text "Young's Modulus" ]
          , input [ type_ "number", id "youngs-mod", name "youngs-mod" ] []
          , br [] []
          , label [ for "possion" ] [ text "Possion's Ratio" ]
          , input [ type_ "number", id "possion", name "possion" ] []
          , br [] []
          , input [ type_ "submit", value "Submit"
                  , id "mat-submit"
                  ] []
          ] 
        ]
   
    ]
  ]



