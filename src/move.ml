type t = {
  name : string;
  move_type : CamlType.t;
  power : int;
  max_pp : int;
}

let makeMove name move_type power max_pp =
  { name = String.lowercase_ascii name; move_type; power; max_pp }

let max_pp mv = mv.max_pp
let move_type mv = mv.move_type
let name mv = mv.name
let power mv = mv.power