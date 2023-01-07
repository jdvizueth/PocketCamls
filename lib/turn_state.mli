type t
(* the type representing the choices of a battle *)

val callMoves : unit -> unit
(* show the move options and hide the previous options *)

val callRun : unit -> unit
(* show a message saying "You can't run froma caml battle" *)

val turnDecision : t -> unit -> unit
(* checks which decision the user has made has been made *)

val makeTurn : t
(** Makes a turn variant *)

val runTurn : Pocket_caml.t -> Pocket_caml.t -> Move.t
(** Runs the parts of a turn *)