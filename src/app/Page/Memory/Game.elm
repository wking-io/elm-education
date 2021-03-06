module Page.Memory.Game exposing (Model, Msg, init, update, view)

import Data.Card as Card exposing (Card)
import Data.Memory as Memory
import Data.Option as Option exposing (Option)
import Data.Words as Words
import Request.Words exposing (getDeck, getDeckBy)
import Html exposing (Html, program, text, div, ul, li, img, p)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (on, onMouseDown, onMouseUp, onClick)
import MatchList exposing (MatchList, Position(..))
import Page.Errored as Errored exposing (PageLoadError, pageLoadError)
import Random exposing (Generator)
import Time
import Util.Infix exposing ((=>))
import Util.Delay exposing (delay)
import Util.IsIn exposing (isIn)
import View.Asset exposing (src, cardBack)


-- MODEL --


type alias Model =
    { deck : MatchList Card }


init : Memory.Slug -> Result PageLoadError (Generator Model)
init (Memory.Slug option size maybeSelection) =
    let
        handleLoadError =
            pageLoadError "Match & Memory game is currently unavailable."

        matchlist selection =
            case option of
                Option.Random ->
                    (Words.filterByGroup << isIn) selection
                        |> getDeckBy
                        |> Result.map (Random.map (Model << MatchList.fromList))

                Option.Custom ->
                    getDeck
                        |> Result.map (Random.map (Model << MatchList.fromList))
    in
        case maybeSelection of
            Just selection ->
                matchlist selection
                    |> Result.mapError (\_ -> handleLoadError)

            Nothing ->
                Err handleLoadError



-- VIEW --


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ ul [ class "deck" ]
            (model.deck
                |> MatchList.mapBy viewCard
                |> MatchList.toList
                |> List.sortBy Tuple.first
                |> List.map Tuple.second
            )
        , viewCongrats (MatchList.isComplete model.deck)
        ]


viewCongrats : Bool -> Html Msg
viewCongrats isComplete =
    if isComplete then
        div [ class "congrats" ] [ text "Congrats!" ]
    else
        text ""


viewCard : Position -> Card -> ( Int, Html Msg )
viewCard position card =
    ( card.order
    , li
        [ class "card__container"
        , onClick (SelectCard card.id)
        ]
        [ div
            [ classList
                [ "card" => True
                , "card--flipping" => position == SelectSolo || position == SelectTwo
                , "card--flipped" => position == SelectOne || position == Matched
                ]
            ]
            [ img [ class "card__side card__side--back", src cardBack ] []
            , div [ class "card__side card__side--front" ]
                [ p [ class "card__word" ] [ text card.word ]
                ]
            ]
        ]
    )



-- UPDATE --


type Msg
    = ShuffleDeck (List Card)
    | SelectCard String
    | CheckMatch


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShuffleDeck cards ->
            ( Model (MatchList.fromList cards), Cmd.none )

        SelectCard id ->
            let
                matchlist =
                    MatchList.select (Card.equalsId id) model.deck
            in
                if MatchList.isComparable matchlist then
                    ( { model | deck = matchlist }, delay (Time.second * 1) CheckMatch )
                else
                    ( { model | deck = matchlist }, Cmd.none )

        CheckMatch ->
            ( { model | deck = MatchList.compare Card.equals model.deck }, Cmd.none )
