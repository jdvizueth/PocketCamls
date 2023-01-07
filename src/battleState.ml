module PC = PocketCaml
module TSH = TurnStateHuman
module TSB = TurnStateBot
module T = Trainer
module TH = TrainerHuman
module TB = TrainerBot
module BO = BattleOutput

(* creates a new record for the parts of the battle *)
type t = {
  player1 : TH.t;
  player2 : TB.t;
}

let callCamls () =
  Images.caml1 ();
  Images.caml2 ()

let turn_human trainerH trainerB =
  TSH.runTurnHuman trainerH trainerB;
  let hactive_caml = TH.active_caml trainerH in
  let bactive_caml = TB.active_caml trainerB in
  BO.show_health_bars (PC.pname hactive_caml) (PC.hp hactive_caml)
    (PC.pname bactive_caml) (PC.hp bactive_caml) 100;
  TB.has_lost trainerB;
  print_endline "press ENTER to continue";
  ignore (read_line ());
  TH.has_lost trainerH

let turn_bot trainerB trainerH =
  TSB.runTurnBot trainerB trainerH;
  let hactive_caml = TH.active_caml trainerH in
  let bactive_caml = TB.active_caml trainerB in
  BO.show_health_bars (PC.pname hactive_caml) (PC.hp hactive_caml)
    (PC.pname bactive_caml) (PC.hp bactive_caml) 100;
  TH.has_lost trainerH;
  TB.has_lost trainerB;
  print_endline "press ENTER to continue";
  ignore (read_line ())

let runTurnStateHelper turn =
  let camlHuman = TH.active_caml turn.player1 in
  let camlBot = TB.active_caml turn.player2 in
  if PC.speed camlBot > PC.speed camlHuman then (
    turn_bot turn.player2 turn.player1;
    turn_human turn.player1 turn.player2)
  else (
    turn_human turn.player1 turn.player2;
    print_endline "Bot's turn now";
    turn_bot turn.player2 turn.player1)

let rec callTurnState (turn : t) =
  runTurnStateHelper turn;
  callTurnState turn

(* brings up a Turn State *)

let runBattle trainerH trainerB : unit =
  BO.start_battle ();
  print_endline "press ENTER to continue";
  ignore (read_line ());
  callCamls ();
  callTurnState { player1 = trainerH; player2 = trainerB }
