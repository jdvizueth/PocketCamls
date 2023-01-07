module Move = Move
module PocketCaml = Pocket_caml

type t = Fight

let get_mv (caml : PocketCaml.t) (nm : int) =
  List.nth (PocketCaml.moves caml) nm

let get_name_mv mv = Move.name mv

let parse_fight caml str =
  let mv1 = get_mv caml 1 in
  let mv2 = get_mv caml 2 in
  let mv3 = get_mv caml 3 in
  let mv4 = get_mv caml 4 in
  if str = get_name_mv mv1 then mv1
  else if str = get_name_mv mv2 then mv2
  else if str = get_name_mv mv3 then mv3
  else mv4

let callMoves caml () =
  print_string (PocketCaml.caml_moves caml);
  let result = read_line () in
  parse_fight caml result
(* show the move options and hide the previous options *)

let turnDecision caml1 caml2 chk =
  match chk with Fight -> callMoves caml1 caml2
(* checks which decision has been made *)

exception Empty
exception Malformed

let parse str =
  match str with "Fight" | "fight" -> Fight | _ -> raise Malformed

let makeTurn =
  print_string "Fight or Run";
  read_line () |> parse

let runTurn caml1 caml2 = makeTurn |> turnDecision caml1 caml2
