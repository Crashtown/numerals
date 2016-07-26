module Numeral
    exposing
        ( numberToTerm
        , oneToText
        , tenToText
        , hundredToText
        , hundredWithPowToText
        , termToText
        , toNumeral
        )

import Dict exposing (Dict)
import Array exposing (Array)
import String


type alias HundredNode =
    ( Int, Int, Int )


type alias TenNode =
    ( Int, Int )


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


pows =
    Array.fromList
        [ "thousand"
        , "million"
        , "billion"
        , "trillion"
        , "quadrillion"
        , "quintillion"
        , "sextillion"
        , "septillion"
        ]


(=>) a b =
    (,) a b


dictGetDirty : Dict comparable value -> comparable -> value
dictGetDirty dict key =
    case Dict.get key dict of
        Just value ->
            value

        Nothing ->
            Debug.crash "Unacceptable"


arrayGetDirty : Array String -> Int -> String
arrayGetDirty array index =
    case Array.get index array of
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
numberToTerm' number acc =
    case number of
        0 ->
            acc

        number ->
            let
                ( rest, reminder ) =
                    number `divmod` 1000
            in
                numberToTerm' rest ((toHundredNode reminder) :: acc)


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
    ones `dictGetDirty` number


tenToText : TenNode -> String
tenToText ( ten, one ) =
    case ten of
        0 ->
            oneToText one

        1 ->
            teenToText one

        _ ->
            let
                tenText =
                    tens `dictGetDirty` ten
            in
                case one of
                    0 ->
                        tenText

                    _ ->
                        tenText ++ "-" ++ oneToText one


teenToText : Int -> String
teenToText number =
    teens `dictGetDirty` number


hundredToText : HundredNode -> String
hundredToText ( hundred, ten, one ) =
    if hundred == 0 then
        (tenToText ( ten, one ))
    else
        let
            hundredText =
                (oneToText hundred) ++ " hundred"
        in
            if ten == 0 && one == 0 then
                hundredText
            else
                hundredText ++ " " ++ (tenToText ( ten, one ))


hundredWithPowToText : HundredNode -> Int -> String
hundredWithPowToText hundredNode pow =
    let
        hundredText =
            hundredToText hundredNode
    in
        if pow == 0 then
            hundredText
        else
            hundredText ++ " " ++ (pows `arrayGetDirty` (pow - 1))


termToText : List HundredNode -> String
termToText term =
    String.join ", " (termToText' (List.reverse term) [] 0)


termToText' : List HundredNode -> List String -> Int -> List String
termToText' term acc i =
    case term of
        [] ->
            acc

        head :: tail ->
            case head of
                ( 0, 0, 0 ) ->
                    termToText' tail acc (i + 1)

                _ ->
                    termToText' tail ((hundredWithPowToText head i) :: acc) (i + 1)


toNumeral : Int -> String
toNumeral number =
    if number == 0 then
        "zero"
    else
        termToText (numberToTerm number)
