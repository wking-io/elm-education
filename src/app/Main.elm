module Main exposing (main)

import Html exposing (Html, program, text, button)
import Html.Attributes as Html exposing (class)
import Html.Events exposing (on, onMouseDown, onMouseUp)
import Json.Decode as Decode
import SelectList exposing (SelectList)
import Svg exposing (svg, polyline)
import Svg.Attributes as Svg exposing (class, fill, stroke, strokeWidth, points)
import Mouse exposing (Position)


-- MODEL --


type alias Model =
    { isDrawing : Bool
    , content : Maybe (SelectList (List Position))
    }


init : ( Model, Cmd Msg )
init =
    ( Model False Nothing, Cmd.none )



-- VIEW --


view : Model -> Html Msg
view model =
    let
        handlers =
            if model.isDrawing then
                [ getMouseOn "mouseup" DrawEnd, getMouseOn "mousemove" DrawAt ]
            else
                [ getMouseOn "mousedown" DrawStart ]
    in
        Html.main_ []
            [ svg (List.append [ Svg.class "artboard" ] handlers) (renderLines model.content)
            , button [ Html.class "eraser" ] [ text "Clear Artboard" ]
            ]


renderLines : Maybe (SelectList (List Position)) -> List (Html Msg)
renderLines maybeLines =
    case maybeLines of
        Nothing ->
            [ text "" ]

        Just lines ->
            getActiveLines lines
                |> List.map toPoints
                |> List.map toLine


toLine : String -> Html Msg
toLine thePoints =
    polyline [ fill "none", stroke "#000000", strokeWidth "4", points thePoints ] []


toPoints : List Position -> String
toPoints coords =
    coords
        |> List.map toPoint
        |> List.intersperse " "
        |> List.foldl (++) ""


toPoint : Position -> String
toPoint { x, y } =
    toString x ++ "," ++ toString y



-- renderLine : Path -> Html msg
-- renderLine { current, history } =
--     case history of
--         Nothing ->
--             polyline [] []
--         Just coords ->
--             polyline [ fill "none", stroke "#000000", strokeWidth (px 2), points "" ] []


px : Int -> String
px number =
    toString number ++ "px"


getMouseOn : String -> (Position -> Msg) -> Html.Attribute Msg
getMouseOn event msg =
    on event (Decode.map msg Mouse.position)



-- UPDATE --


type Msg
    = DrawStart Position
    | DrawAt Position
    | DrawEnd Position


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( updateHelp msg model, Cmd.none )


updateHelp : Msg -> Model -> Model
updateHelp msg model =
    case msg of
        DrawStart position ->
            { model | isDrawing = True, content = startLine model.content position }

        DrawAt position ->
            { model | content = drawLine model.content position }

        DrawEnd position ->
            { model | isDrawing = False, content = drawLine model.content position }


startLine : Maybe (SelectList (List Position)) -> Position -> Maybe (SelectList (List Position))
startLine maybeLines position =
    case maybeLines of
        Nothing ->
            Just (SelectList.singleton (List.singleton position))

        Just lines ->
            Just (SelectList.fromLists (getActiveLines lines) (List.singleton position) ([]))


drawLine : Maybe (SelectList (List Position)) -> Position -> Maybe (SelectList (List Position))
drawLine maybeLines position =
    case maybeLines of
        Nothing ->
            Just (SelectList.singleton (List.singleton position))

        Just lines ->
            Just (SelectList.mapBy (addPosition position) lines)


addPosition : Position -> SelectList.Position -> List Position -> List Position
addPosition position item line =
    if item == SelectList.Selected then
        List.append line (List.singleton position)
    else
        line



-- HELPERS


getActiveLines : SelectList (List Position) -> List (List Position)
getActiveLines lines =
    List.append (SelectList.before lines) (List.singleton (SelectList.selected lines))



-- SUBSCRIPTIONS
-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \model -> Sub.none
        }
