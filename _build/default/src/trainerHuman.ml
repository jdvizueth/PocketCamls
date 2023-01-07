module T = Trainer
module PC = PocketCaml
include T

let rec switch_caml trainer caml =
  let camls = T.caml_list trainer in
  if List.mem (String.lowercase_ascii caml) (caml_name_list camls []) then (
    match PocketCaml.hp (str_to_caml camls caml) with
    | 0 ->
        print_endline
          (caml ^ " has no health left. You can't switch to this caml");
        switch_caml trainer (read_line ())
    | _ ->
        print_endline ("That's enough " ^ caml ^ "! Come back!");

        T.new_active_caml trainer (str_to_caml (T.caml_list trainer) caml);
        Images.set_caml1_color
          (CamlType.get_name (PC.caml_type (T.active_caml trainer))))
  else (
    print_endline "Invalid Caml";
    switch_caml trainer (read_line ()))

let has_lost trainer : unit =
  let tname = T.trainer_name trainer in
  if PC.hp (T.active_caml trainer) = 0 then
    if T.active_camls (T.caml_list trainer) 0 = 0 then (
      print_endline ("Trainer " ^ tname ^ " has no more remaining camls!");

      print_endline ("Trainer " ^ tname ^ " has lost the match");

      exit 0)
    else (
      BattleOutput.switch_options
        (Trainer.caml_name_list (caml_list trainer) []);
      let new_caml = read_line () in
      switch_caml trainer new_caml)
  else print_endline ""
(*(PC.pname (T.active_caml trainer) ^ " has " ^ string_of_int (PC.hp
  (T.active_caml trainer)) ^ " HP remaining.")*)
