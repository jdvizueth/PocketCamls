module CamlType = Caml_type
module Move = Move

type t = {
  init_max_hp : int;
  hp : int;
  moves : Move.t list;
  speed : int;
  caml_type : CamlType.t;
}

let hp caml = caml.hp
let max_hp caml = caml.init_max_hp
(* TODO: once levels are implemented, change this with the current max hp *)

let speed caml = caml.speed
(* returns the speed of a caml *)

let moves caml = caml.moves

let caml_moves caml =
  let rec caml_moves_rec lst acc =
    match lst with
    | [] -> acc
    | h :: t -> caml_moves_rec t (Move.name h ^ "; " ^ acc)
  in
  caml_moves_rec (moves caml) " are this caml's moves"
