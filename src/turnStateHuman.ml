module TS = TurnState
module PC = PocketCaml
module TB = TrainerBot
module TH = TrainerHuman
module BO = BattleOutput
include TS

let rec parse_fight caml1 caml2 : unit =
  let str = String.lowercase_ascii (read_line ()) in
  let mv1 = get_mv caml1 0 in
  let mv2 = get_mv caml1 1 in
  let mv3 = get_mv caml1 2 in
  let mv4 = get_mv caml1 3 in

  if str = get_name_mv mv1 then attack_success caml1 caml2 true mv1
  else if str = get_name_mv mv2 then attack_success caml1 caml2 true mv2
  else if str = get_name_mv mv3 then attack_success caml1 caml2 true mv3
  else if str = get_name_mv mv4 then attack_success caml1 caml2 true mv4
  else (
    print_endline ("Move: " ^ str ^ " unknown");
    parse_fight caml1 caml2)

let caml_call (trainerH : TH.t) (trainerB : TB.t) =
  let act_caml = TH.active_caml trainerH in
  let act_caml_e = TB.active_caml trainerB in
  BO.fight_options (PC.pname act_caml) (PC.caml_moves act_caml);
  parse_fight act_caml act_caml_e

let rec makeTurn (trainerH : TH.t) (trainerB : TB.t) =
  BO.battle_options ();

  let input = read_line () in
  match String.lowercase_ascii input with
  | "fight" ->
      BO.print_choice_battle "fight";
      Images.caml1_battle_forme ();
      print_endline "press ENTER to continue";
      ignore (read_line ())
  | "run" ->
      BO.print_choice_battle "run";
      makeTurn trainerH trainerB
  | "switch" ->
      BO.print_choice_battle "switch";
      BO.switch_options (TH.caml_name_list (TH.caml_list trainerH) []);
      let new_caml = read_line () in
      TH.switch_caml trainerH (String.lowercase_ascii new_caml)
  | _ ->
      print_endline ("Command: " ^ input ^ " unknown");
      makeTurn trainerH trainerB

let runTurnHuman trainerH trainerB =
  makeTurn trainerH trainerB;
  caml_call trainerH trainerB
