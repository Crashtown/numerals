module Numeral exposing (numberToTerm, oneToText)


type alias HundredNode =
    ( Int, Int, Int )


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


oneToText : Int -> String
