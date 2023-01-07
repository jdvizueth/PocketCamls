type t = int

let grass = 0
let fire = 1
let water = 2
let effect_table = [ [ 0; 1; -1 ]; [ -1; 0; 1 ]; [ 1; -1; 0 ] ]
(* the ith element of effect_table is the effectiveness of i-type moves on all
   camls. Call this table_i the jth element of tabe_i is how effective a i-type
   move is against a j-type caml *)

let effectiveness move_type target_type =
  move_type |> List.nth (target_type |> List.nth effect_table)

let get_name = function
  | typ when typ = grass -> "grass"
  | typ when typ = fire -> "fire"
  | typ when typ = water -> "water"
  | _ -> "???"

exception InvalidType

let makeCamlType (t : string) =
  match t with
  | "grass" -> grass
  | "water" -> water
  | "fire" -> fire
  | _ -> raise InvalidType
