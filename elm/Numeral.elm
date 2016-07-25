module Numeral exposing (numberToTerm)


divmod : Int -> Int -> ( Int, Int )
divmod number divider =
    ( (number // divider), (rem number divider) )


numberToTerm number =
    numberToTerm' number []


numberToTerm' number accumulator =
    case number of
        0 ->
            accumulator

        number ->
            let
                ( rest, reminder ) =
                    divmod number 1000
            in
                numberToTerm' rest ((toHundredNode reminder) :: accumulator)


toHundredNode : Int -> ( Int, Int, Int )
toHundredNode number =
    let
        ( hundred, rest ) =
            divmod number 100

        ( ten, one ) =
            divmod rest 10
    in
        ( hundred, ten, one )
