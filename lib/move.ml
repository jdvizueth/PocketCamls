module CamlType = Caml_type

type t = { name : string; move_type : CamlType.t; power : int; max_pp : int }

let max_pp mv = mv.max_pp
let move_power mv = mv.power
let name mv = mv.name
