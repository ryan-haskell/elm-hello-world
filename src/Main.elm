module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, h2, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)


main : Program () Int Msg
main =
    Browser.sandbox
        { init = initialModel
        , update = update
        , view = view
        }


initialModel : Int
initialModel =
    0


view : Int -> Html Msg
view model =
    div [ class "hero is-dark is-fullheight" ]
        [ div
            [ class "hero-body" ]
            [ div
                [ class "container" ]
                [ h2 [ class "title is-1" ] [ text (String.fromInt model) ]
                , div [ class "buttons" ]
                    [ button [ class "button", onClick Plus ] [ text "+" ]
                    , button [ class "button", onClick Minus ] [ text "-" ]
                    , button [ class "button", onClick Reset ] [ text "reset" ]
                    ]
                ]
            ]
        ]


type Msg
    = Plus
    | Minus
    | Reset


update : Msg -> Int -> Int
update msg model =
    case msg of
        Plus ->
            model + 1

        Minus ->
            model - 1

        Reset ->
            0
