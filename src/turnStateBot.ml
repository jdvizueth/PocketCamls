module TS = TurnState
module PC = PocketCaml
module TB = TrainerBot
module TH = TrainerHuman
include TS

let rec find_best_move (enemy_cml : PC.t) (move_list : Move.t list)
    (best_move : Move.t) : Move.t =
  let final_dmg caml mv =
    let caml_type = PocketCaml.caml_type caml in
    let mv_type = Move.move_type mv in
    let mv_power = Move.power mv in
    let effect = CamlType.effectiveness mv_type caml_type in
    match effect with
    | -1 -> mv_power
    | 0 -> mv_power * 2
    | 1 -> mv_power * 3
    | _ -> failwith "Bot couldn't choose a move"
  in
  match move_list with
  | [] -> best_move
  | h :: t ->
      if final_dmg enemy_cml h > final_dmg enemy_cml best_move then
        find_best_move enemy_cml t h
      else find_best_move enemy_cml t best_move

let runTurnBot trainerB trainerH =
  let bot_caml = TB.active_caml trainerB in
  let human_caml = TH.active_caml trainerH in
  let move_chosen =
    (*List.hd (PC.moves bot_caml)*)
    (* will be changed as difficulty increases *)
    find_best_move human_caml (PC.moves bot_caml) (List.hd (PC.moves bot_caml))
  in

  TS.attack_success bot_caml human_caml false move_chosen
