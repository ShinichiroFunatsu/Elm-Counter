module CounterTest exposing (updateTest, viewTest)

import Counter exposing (..)
import Expect exposing (Expectation)
import Test exposing (..)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (containing, tag, text)


viewTest : Test
viewTest =
    describe "view tests" <|
        [ describe "Counter Display"
            [ test "Counter shows 0" <|
                \_ ->
                    view 0
                        |> Query.fromHtml
                        |> Query.find [ tag "p" ]
                        |> Query.has [ text "0" ]
            , test "Counter shows 15" <|
                \_ ->
                    view 15
                        |> Query.fromHtml
                        |> Query.find [ tag "p" ]
                        |> Query.has [ text "15" ]
            ]
        , describe "Inc Dec Button"
            [ test "+button fire Inc Msg" <|
                \_ ->
                    view 0
                        |> Query.fromHtml
                        |> Query.find [ tag "button", containing [ text "+" ] ]
                        |> Event.simulate Event.click
                        |> Event.expect Inc
            , test "+button fire Dec Msg" <|
                \_ ->
                    view 0
                        |> Query.fromHtml
                        |> Query.find [ tag "button", containing [ text "-" ] ]
                        |> Event.simulate Event.click
                        |> Event.expect Dec
            ]
        ]


updateTest : Test
updateTest =
    describe "update test" <|
        [ describe "Increace Counter"
            [ test "Given Counter 0 When Inc fired Then Counter become 1" <|
                \_ ->
                    update Inc 0
                        |> Tuple.first
                        |> Expect.equal 1
            , test "Given Counte 5 When Inc fired Then Counter become 6" <|
                \_ ->
                    update Inc 5
                        |> Tuple.first
                        |> Expect.equal 6
            , test "Given Counter 0 When Inc fired x5 Counter become 5" <|
                \_ ->
                    update Inc 0
                        |> Tuple.first
                        |> update Inc
                        |> Tuple.first
                        |> update Inc
                        |> Tuple.first
                        |> update Inc
                        |> Tuple.first
                        |> update Inc
                        |> Tuple.first
                        |> Expect.equal 5
            ]
        ]
