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
          -- , test "Addition" (assertEqual (3 + 7) 10)
          -- , test "String.left" (assertEqual "a" (String.left 1 "abcdefg"))
          -- , test "This test should fail" (assert False)
        ]


main : Program Never
main =
    runSuiteHtml tests
