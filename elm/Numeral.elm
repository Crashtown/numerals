module Numeral exposing (numberToTerm, oneToText, tenToText)

import Dict exposing (Dict)


type alias HundredNode =
    ( Int, Int, Int )


ones =
    Dict.fromList
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


teens =
    Dict.fromList
        [ 0 => "ten"
        , 1 => "eleven"
        , 2 => "twelve"
        , 3 => "thirteen"
        , 4 => "fourteen"
        , 5 => "fifteen"
        , 6 => "sixteen"
        , 7 => "seventeen"
        , 8 => "eighteen"
        , 9 => "nineteen"
        ]


tens =
    Dict.fromList
        [ 2 => "twenty"
        , 3 => "thirty"
        , 4 => "forty"
        , 5 => "fifty"
        , 6 => "sixty"
        , 7 => "seventy"
        , 8 => "eighty"
        , 9 => "ninety"
        ]


(=>) a b =
    (,) a b


getDirty : Dict comparable value -> comparable -> value
getDirty dict key =
    case Dict.get key dict of
        Just value ->
            value

        Nothing ->
            Debug.crash "Unacceptable"


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
            number `divmod` 100

        ( ten, one ) =
            rest `divmod` 10
    in
        ( hundred, ten, one )


oneToText : Int -> String
oneToText number =
    ones `getDirty` number


tenToText : ( Int, Int ) -> String
tenToText ( ten, one ) =
    case ten of
        0 ->
            oneToText one

        1 ->
            teenToText one

        _ ->
            let
                tenText =
                    tens `getDirty` ten
            in
                case one of
                    0 ->
                        tenText

                    _ ->
                        tenText ++ "-" ++ oneToText one


teenToText : Int -> String
teenToText number =
    teens `getDirty` number
