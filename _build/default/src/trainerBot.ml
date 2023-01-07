module T = Trainer
module PC = PocketCaml
include T

let switch_caml trainer =
  let new_caml = List.find (fun x -> PC.hp x > 0) (T.caml_list trainer) in
  T.new_active_caml trainer new_caml;
  Images.set_caml2_color
    (trainer |> active_caml |> PC.caml_type |> CamlType.get_name)

let has_lost trainer =
  let tname = T.trainer_name trainer in
  let act_caml = T.active_caml trainer in
  if PC.hp act_caml = 0 then
    if T.active_camls (T.caml_list trainer) 0 = 0 then (
      print_endline ("Enemy Trainer " ^ tname ^ " has no more remaining camls!");

      print_endline "Congrats! You have won the match!";

      exit 0)
    else (
      switch_caml trainer;
      print_endline
        ("Enemy Trainer " ^ tname ^ " sent out "
        ^ PC.pname (T.active_caml trainer)))
  else print_endline ""