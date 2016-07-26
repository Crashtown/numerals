module Main exposing (..)

import Html exposing (Html, Attribute, div, input, text)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String
import Numeral


main =
    Html.beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { content : String
    }


model : Model
model =
    { content = "" }


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }


toNumeral : String -> String
toNumeral content =
    content
        |> String.toInt
        |> Result.withDefault 0
        |> Numeral.toNumeral
        |> toString


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Text to reverse", onInput Change ] []
        , div [] [ text (toNumeral model.content) ]
        ]
