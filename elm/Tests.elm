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
        , suite "transforms hundreds to text"
            [ defaultTest (assertEqual "one hundred" (Numeral.hundredToText ( 1, 0, 0 )))
            , defaultTest (assertEqual "six hundred two" (Numeral.hundredToText ( 6, 0, 2 )))
            , defaultTest (assertEqual "one hundred nineteen" (Numeral.hundredToText ( 1, 1, 9 )))
            , defaultTest (assertEqual "one hundred twenty" (Numeral.hundredToText ( 1, 2, 0 )))
            , defaultTest (assertEqual "two hundred twenty-two" (Numeral.hundredToText ( 2, 2, 2 )))
            ]
        , suite "transforms hundreds with pow to text"
            [ defaultTest (assertEqual "one" (Numeral.hundredWithPowToText ( 0, 0, 1 ) 0))
            , defaultTest (assertEqual "one thousand" (Numeral.hundredWithPowToText ( 0, 0, 1 ) 1))
            , defaultTest (assertEqual "one million" (Numeral.hundredWithPowToText ( 0, 0, 1 ) 2))
            , defaultTest (assertEqual "one billion" (Numeral.hundredWithPowToText ( 0, 0, 1 ) 3))
            ]
        , suite "transforms term to text"
            [ defaultTest
                (assertEqual "seven million, six hundred fifty-four thousand, three hundred twenty-one"
                    (Numeral.termToText
                        [ ( 0, 0, 7 )
                        , ( 6, 5, 4 )
                        , ( 3, 2, 1 )
                        ]
                    )
                )
            , defaultTest
                (assertEqual "five billion, four hundred thirty-seven million, three hundred twenty-one"
                    (Numeral.termToText
                        [ ( 0, 0, 5 )
                        , ( 4, 3, 7 )
                        , ( 0, 0, 0 )
                        , ( 3, 2, 1 )
                        ]
                    )
                )
            ]
        , suite "toNumeral"
            [ defaultTest
                (assertEqual "seven million, six hundred fifty-four thousand, three hundred twenty-one"
                    (Numeral.toNumeral 7654321)
                )
            , defaultTest
                (assertEqual "five billion, four hundred thirty-seven million, six hundred fifty-four thousand, three hundred twenty-one"
                    (Numeral.toNumeral 5437654321)
                )
            , defaultTest (assertEqual "zero" (Numeral.toNumeral 0))
            ]
        ]


main : Program Never
main =
    runSuiteHtml tests
