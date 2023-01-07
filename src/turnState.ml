type t = Fight

let effectiveness_message = ref "It's Alright I Guess"

let get_mv (caml : PocketCaml.t) (nm : int) =
  List.nth (PocketCaml.moves caml) nm

let get_name_mv mv = Move.name mv

exception Empty
exception Malformed
exception InvalidInput

let total_dmg caml mv =
  let caml_type = PocketCaml.caml_type caml in
  let mv_type = Move.move_type mv in
  let mv_power = Move.power mv in
  let effect = CamlType.effectiveness mv_type caml_type in
  match effect with
  | -1 ->
      effectiveness_message := "It's not very effective...";

      mv_power
  | 0 ->
      effectiveness_message := "It's alright I guess";
      mv_power * 2
  | 1 ->
      effectiveness_message := "It's Super Effective!";
      mv_power * 3
  | _ -> raise InvalidInput

let attack caml2 mv =
  PocketCaml.hp caml2 - total_dmg caml2 mv |> PocketCaml.set_hp caml2

let attack_success (caml1 : PocketCaml.t) (caml2 : PocketCaml.t) (human : bool)
    mv =
  let run_ani =
    if human then Images.caml1_attack_ani () else Images.caml2_attack_ani ()
  in
  run_ani;
  attack caml2 mv;
  if human then
    BattleOutput.print_fight_choice human
      (CamlType.get_name (PocketCaml.caml_type caml1))
      (CamlType.get_name (PocketCaml.caml_type caml2))
      (Move.name mv) !effectiveness_message
  else
    BattleOutput.print_fight_choice human
      (CamlType.get_name (PocketCaml.caml_type caml2))
      (CamlType.get_name (PocketCaml.caml_type caml1))
      (Move.name mv) !effectiveness_message
