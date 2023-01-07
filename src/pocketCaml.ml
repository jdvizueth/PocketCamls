type t = {
  name : string;
  init_max_hp : int;
  mutable hp : int;
  moves : Move.t list;
  speed : int;
  caml_type : CamlType.t;
}

let makeCaml name init_max_hp hp moves speed caml_type : t =
  {
    name = String.lowercase_ascii name;
    init_max_hp;
    hp;
    moves;
    speed;
    caml_type;
  }

let caml_type caml = caml.caml_type
let hp caml = caml.hp
let max_hp caml = caml.init_max_hp
(* TODO: once levels are implemented, change this with the current max hp *)

let set_hp cml hp = if hp <= 0 then cml.hp <- 0 else cml.hp <- hp
let speed caml = caml.speed
(* returns the speed of a caml *)

let moves caml = caml.moves

(*let caml_moves caml = let rec caml_moves_rec lst acc = match lst with | [] ->
  acc | h :: t -> caml_moves_rec t (Move.name h ^ "; " ^ acc) in caml_moves_rec
  (moves caml) " are this caml's moves" *)

let caml_moves caml =
  let rec caml_moves_rec lst acc =
    match lst with
    | [] -> acc
    | h :: t -> caml_moves_rec t (Move.name h :: acc)
  in
  caml_moves_rec (moves caml) []

let pname caml = caml.name

let make_copy (trainer_name : string) (caml : t) =
  { caml with name = String.lowercase_ascii trainer_name ^ "'s " ^ pname caml }
