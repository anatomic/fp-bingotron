module State exposing (init, subscriptions, update)

import Types exposing (..)
import Dict
import Set
import Keyboard
import Process
import Random
import Random.Set
import Task
import Time
import Topics.Functor as Functor
import Navigation


topicData : Dict.Dict String String
topicData =
    Dict.fromList
        [ ( "Functor", Functor.content )
        , ( "Arity", "" )
        , ( "Currying", "" )
        , ( "Auto Currying", "" )
        , ( "Higher Order Function", "" )
        , ( "Closure", "" )
        , ( "Partial Application", "" )
        , ( "Point-Free Style", "" )
        , ( "Purity", "" )
        , ( "Idempotent", "" )
        , ( "Side Effect", "" )
        , ( "Side Cause", "" )
        , ( "Function Composition", "" )
        , ( "Associativity", "" )
        , ( "Commutativity", "" )
        , ( "Semigroup", "" )
        , ( "Monoid", "" )
        , ( "Monad", "" )
        , ( "Predicate", "" )
        , ( "Contracts", "" )
        , ( "Setoid", "" )
        , ( "Lambda", "" )
        , ( "Pointed Functor", "" )
        , ( "Applicative Functor", "" )
        , ( "Morphism", "" )
        , ( "Endomorphism", "" )
        , ( "Isomorphism", "" )
        , ( "Referential Transparency", "" )
        ]


topics : Set.Set String
topics =
    Set.fromList <| Dict.keys topicData



-- [ "Arity"
-- , "Currying"
-- , "Auto Currying"
-- , "Higher Order Function"
-- , "Closure"
-- , "Partial Application"
-- , "Point-Free Style"
-- , "Purity"
-- , "Idempotent"
-- , "Side Effect"
-- , "Side Cause"
-- , "Function Composition"
-- , "Associativity"
-- , "Commutativity"
-- , "Semigroup"
-- , "Monoid"
-- , "Monad"
-- , "Predicate"
-- , "Contracts"
-- , "Setoid"
-- , "Lambda"
-- , "Functor"
-- , "Pointed Functor"
-- , "Applicative Functor"
-- , "Morphism"
-- , "Endomorphism"
-- , "Isomorphism"
-- , "Referential Transparency"
-- ]


initialModel : Model
initialModel =
    { topics = topicData
    , topicsToCover = topics
    , currentTopic = Just "Functional Programming in JavaScript"
    , topicGenerator = Random.Set.sample topics
    , history = []
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { initialModel | history = [ location ] }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    case Set.isEmpty model.topicsToCover of
        True ->
            Sub.batch []

        False ->
            Sub.batch
                [ Keyboard.downs NextRound
                ]


delay : Time.Time -> msg -> Cmd msg
delay time msg =
    Process.sleep time |> Task.andThen (always <| Task.succeed msg) |> Task.perform identity


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NextRound code ->
            case model.currentTopic of
                Nothing ->
                    ( model, Cmd.none )

                Just t ->
                    case code of
                        39 ->
                            ( { model | currentTopic = Nothing }, delay (Time.second * 2) PickTopic )

                        _ ->
                            ( model, Cmd.none )

        PickTopic ->
            ( model, Random.generate ShowTopic model.topicGenerator )

        ShowTopic topic ->
            case topic of
                Nothing ->
                    ( model, Cmd.none )

                Just t ->
                    let
                        currentTopic =
                            Just t

                        topicsToCover =
                            (Set.remove t model.topicsToCover)

                        topicGenerator =
                            (Random.Set.sample topicsToCover)
                    in
                        ( { model | currentTopic = currentTopic, topicsToCover = topicsToCover, topicGenerator = topicGenerator }, Cmd.none )

        UrlChange location ->
            ( { model | history = location :: model.history }, Cmd.none )

        _ ->
            ( model, Cmd.none )
