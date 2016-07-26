module Numeral exposing (numberToTerm, oneToText)

import Dict exposing (fromList, get)


type alias HundredNode =
    ( Int, Int, Int )


(=>) a b =
    (,) a b


ones =
    fromList
        [ 1 => "one"
        , 2 => "two"
        , 3 => "three"
        , 4 => "four"
        , 5 => "five"
        , 6 => "six"
        , 7 => "seven"
        , 8 => "eight"
        , 9 => "nine"
        ]


divmod : Int -> Int -> ( Int, Int )
divmod number divider =
    ( (number // divider), (number `rem` divider) )


numberToTerm : Int -> List HundredNode
numberToTerm number =
    numberToTerm' number []


numberToTerm' : Int -> List HundredNode -> List HundredNode
numberToTerm' number accumulator =
    case number of
        0 ->
            accumulator

        number ->
            let
                ( rest, reminder ) =
                    number `divmod` 1000
            in
                numberToTerm' rest ((toHundredNode reminder) :: accumulator)


toHundredNode : Int -> HundredNode
toHundredNode number =
    let
        ( hundred, rest ) =
            divmod number 100

        ( ten, one ) =
            divmod rest 10
    in
        ( hundred, ten, one )


oneToText number =
    case Dict.get number ones of
        Just value ->
            value

        Nothing ->
            Debug.crash "Unaceptable value"
