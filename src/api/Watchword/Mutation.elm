-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module WatchWord.Mutation exposing (..)

import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)
import WatchWord.InputObject
import WatchWord.Interface
import WatchWord.Object
import WatchWord.Scalar
import WatchWord.Union


{-| Select fields to build up a top-level mutation. The request can be sent with
functions from `Graphqelm.Http`.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) RootMutation
selection constructor =
    Object.selection constructor


type alias ArchiveGameRequiredArguments =
    { id : WatchWord.Scalar.Id }


{-|

  - id -

-}
archiveGame : ArchiveGameRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Game -> Field (Maybe decodesTo) RootMutation
archiveGame requiredArgs object =
    Object.selectionField "archiveGame" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw) ] object (identity >> Decode.nullable)


type alias CreateGameRequiredArguments =
    { input : WatchWord.InputObject.GameInput }


{-|

  - input -

-}
createGame : CreateGameRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Game -> Field decodesTo RootMutation
createGame requiredArgs object =
    Object.selectionField "createGame" [ Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeGameInput ] object identity


type alias CreatePatternRequiredArguments =
    { input : WatchWord.InputObject.PatternInput }


{-|

  - input -

-}
createPattern : CreatePatternRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Pattern -> Field decodesTo RootMutation
createPattern requiredArgs object =
    Object.selectionField "createPattern" [ Argument.required "input" requiredArgs.input WatchWord.InputObject.encodePatternInput ] object identity


type alias CreateSessionRequiredArguments =
    { input : WatchWord.InputObject.SessionInput }


{-|

  - input -

-}
createSession : CreateSessionRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Session -> Field decodesTo RootMutation
createSession requiredArgs object =
    Object.selectionField "createSession" [ Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeSessionInput ] object identity


type alias CreateWordRequiredArguments =
    { input : WatchWord.InputObject.WordInput }


{-|

  - input -

-}
createWord : CreateWordRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Word -> Field decodesTo RootMutation
createWord requiredArgs object =
    Object.selectionField "createWord" [ Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeWordInput ] object identity


type alias CompleteSessionRequiredArguments =
    { id : WatchWord.Scalar.Id }


{-|

  - id -

-}
completeSession : CompleteSessionRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Session -> Field decodesTo RootMutation
completeSession requiredArgs object =
    Object.selectionField "completeSession" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw) ] object identity


type alias DeleteGameRequiredArguments =
    { id : WatchWord.Scalar.Id }


{-|

  - id -

-}
deleteGame : DeleteGameRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Game -> Field (Maybe decodesTo) RootMutation
deleteGame requiredArgs object =
    Object.selectionField "deleteGame" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw) ] object (identity >> Decode.nullable)


type alias DeletePatternRequiredArguments =
    { id : WatchWord.Scalar.Id }


{-|

  - id -

-}
deletePattern : DeletePatternRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Pattern -> Field (Maybe decodesTo) RootMutation
deletePattern requiredArgs object =
    Object.selectionField "deletePattern" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw) ] object (identity >> Decode.nullable)


type alias DeleteSessionRequiredArguments =
    { id : WatchWord.Scalar.Id }


{-|

  - id -

-}
deleteSession : DeleteSessionRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Session -> Field (Maybe decodesTo) RootMutation
deleteSession requiredArgs object =
    Object.selectionField "deleteSession" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw) ] object (identity >> Decode.nullable)


type alias DeleteWordRequiredArguments =
    { id : WatchWord.Scalar.Id }


{-|

  - id -

-}
deleteWord : DeleteWordRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Word -> Field (Maybe decodesTo) RootMutation
deleteWord requiredArgs object =
    Object.selectionField "deleteWord" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw) ] object (identity >> Decode.nullable)


type alias LoginRequiredArguments =
    { input : WatchWord.InputObject.LoginInput }


{-|

  - input -

-}
login : LoginRequiredArguments -> SelectionSet decodesTo WatchWord.Object.User -> Field decodesTo RootMutation
login requiredArgs object =
    Object.selectionField "login" [ Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeLoginInput ] object identity


type alias RecoverRequiredArguments =
    { input : WatchWord.InputObject.RecoverInput }


{-|

  - input -

-}
recover : RecoverRequiredArguments -> SelectionSet decodesTo WatchWord.Object.User -> Field decodesTo RootMutation
recover requiredArgs object =
    Object.selectionField "recover" [ Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeRecoverInput ] object identity


type alias ResetRequiredArguments =
    { resetToken : String, input : WatchWord.InputObject.ResetInput }


{-|

  - resetToken -
  - input -

-}
reset : ResetRequiredArguments -> SelectionSet decodesTo WatchWord.Object.User -> Field decodesTo RootMutation
reset requiredArgs object =
    Object.selectionField "reset" [ Argument.required "resetToken" requiredArgs.resetToken Encode.string, Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeResetInput ] object identity


type alias RestoreGameRequiredArguments =
    { id : WatchWord.Scalar.Id }


{-|

  - id -

-}
restoreGame : RestoreGameRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Game -> Field (Maybe decodesTo) RootMutation
restoreGame requiredArgs object =
    Object.selectionField "restoreGame" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw) ] object (identity >> Decode.nullable)


type alias SignupRequiredArguments =
    { input : WatchWord.InputObject.SignupInput }


{-|

  - input -

-}
signup : SignupRequiredArguments -> SelectionSet decodesTo WatchWord.Object.User -> Field decodesTo RootMutation
signup requiredArgs object =
    Object.selectionField "signup" [ Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeSignupInput ] object identity


type alias UpdateGameRequiredArguments =
    { id : WatchWord.Scalar.Id, input : WatchWord.InputObject.GameInput }


{-|

  - id -
  - input -

-}
updateGame : UpdateGameRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Game -> Field (Maybe decodesTo) RootMutation
updateGame requiredArgs object =
    Object.selectionField "updateGame" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw), Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeGameInput ] object (identity >> Decode.nullable)


type alias UpdatePatternRequiredArguments =
    { id : WatchWord.Scalar.Id, input : WatchWord.InputObject.PatternUpdateInput }


{-|

  - id -
  - input -

-}
updatePattern : UpdatePatternRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Pattern -> Field (Maybe decodesTo) RootMutation
updatePattern requiredArgs object =
    Object.selectionField "updatePattern" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw), Argument.required "input" requiredArgs.input WatchWord.InputObject.encodePatternUpdateInput ] object (identity >> Decode.nullable)


type alias UpdateSessionRequiredArguments =
    { id : WatchWord.Scalar.Id, input : WatchWord.InputObject.SessionUpdateInput }


{-|

  - id -
  - input -

-}
updateSession : UpdateSessionRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Session -> Field (Maybe decodesTo) RootMutation
updateSession requiredArgs object =
    Object.selectionField "updateSession" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw), Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeSessionUpdateInput ] object (identity >> Decode.nullable)


type alias UpdateWordRequiredArguments =
    { id : WatchWord.Scalar.Id, input : WatchWord.InputObject.WordUpdateInput }


{-|

  - id -
  - input -

-}
updateWord : UpdateWordRequiredArguments -> SelectionSet decodesTo WatchWord.Object.Word -> Field (Maybe decodesTo) RootMutation
updateWord requiredArgs object =
    Object.selectionField "updateWord" [ Argument.required "id" requiredArgs.id (\(WatchWord.Scalar.Id raw) -> Encode.string raw), Argument.required "input" requiredArgs.input WatchWord.InputObject.encodeWordUpdateInput ] object (identity >> Decode.nullable)
