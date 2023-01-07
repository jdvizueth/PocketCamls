module Caml = Pocket_caml
module Turn = Turn_state

(* creates a new record for the parts of the battle *)
type t = { player1 : Caml.t; player2 : Caml.t }

let callCamls () = print_endline "Camels are here"
let callBackground () = print_endline "Background has been checked"
(* show the background on the screen *)

let callTurnState (turn : t) : Move.t =
  if Caml.speed turn.player1 > Caml.speed turn.player2 then
    Turn.runTurn turn.player1 turn.player2
  else if Caml.speed turn.player2 > Caml.speed turn.player1 then
    Turn.runTurn turn.player2 turn.player1
  else Turn.runTurn turn.player1 turn.player2
(* brings up a Turn State *)

let runBattle caml1 caml2 =
  callBackground ();
  callCamls ();
  callTurnState { player1 = caml1; player2 = caml2 }
