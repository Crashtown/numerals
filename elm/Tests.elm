module Main exposing (..)

import String
import Numeral
import ElmTest exposing (..)


tests : Test
tests =
    suite "Numerals module"
        [ suite "parses number by thousnd pow to term"
            [ defaultTest
                (assertEqual
                    [ ( 0, 0, 7 )
                    , ( 6, 5, 4 )
                    , ( 3, 2, 1 )
                    ]
                    (Numeral.numberToTerm 7654321)
                )
            , defaultTest
                (assertEqual
                    [ ( 0, 3, 7 )
                    , ( 6, 5, 4 )
                    , ( 3, 2, 1 )
                    ]
                    (Numeral.numberToTerm 37654321)
                )
            , defaultTest
                (assertEqual
                    [ ( 0, 0, 5 )
                    , ( 4, 3, 7 )
                    , ( 6, 5, 4 )
                    , ( 3, 2, 1 )
                    ]
                    (Numeral.numberToTerm 5437654321)
                )
            , defaultTest
                (assertEqual
                    [ ( 0, 0, 5 )
                    , ( 4, 3, 7 )
                    , ( 0, 0, 0 )
                    , ( 3, 2, 1 )
                    ]
                    (Numeral.numberToTerm 5437000321)
                )
            , defaultTest
                (assertEqual
                    [ ( 0, 0, 1 )
                    , ( 0, 0, 0 )
                    ]
                    (Numeral.numberToTerm 1000)
                )
            ]
        , suite "transforms ones to text"
            [ defaultTest (assertEqual "one" (Numeral.oneToText 1))
            , defaultTest (assertEqual "two" (Numeral.oneToText 2))
            , defaultTest (assertEqual "three" (Numeral.oneToText 3))
            , defaultTest (assertEqual "four" (Numeral.oneToText 4))
            , defaultTest (assertEqual "five" (Numeral.oneToText 5))
            , defaultTest (assertEqual "six" (Numeral.oneToText 6))
            , defaultTest (assertEqual "seven" (Numeral.oneToText 7))
            , defaultTest (assertEqual "eight" (Numeral.oneToText 8))
            , defaultTest (assertEqual "nine" (Numeral.oneToText 9))
            ]
        , suite "transforms tens to text"
            [ defaultTest (assertEqual "twenty-two" (Numeral.tenToText ( 2, 2 )))
            , defaultTest (assertEqual "thirty-three" (Numeral.tenToText ( 3, 3 )))
            , defaultTest (assertEqual "ten" (Numeral.tenToText ( 1, 0 )))
            , defaultTest (assertEqual "eleven" (Numeral.tenToText ( 1, 1 )))
            , defaultTest (assertEqual "eighteen" (Numeral.tenToText ( 1, 8 )))
            , defaultTest (assertEqual "sixteen" (Numeral.tenToText ( 1, 6 )))
            ]
        ]


main : Program Never
main =
    runSuiteHtml tests