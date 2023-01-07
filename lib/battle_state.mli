type t
(** The start of the battle scene. Includes 2 players *)

val callCamls : unit -> unit
(** shows the camls on screen *)

val callBackground : unit -> unit
(** shows the background on screen *)

val callTurnState : t -> Turn_state.t
(** calls a Turn State depending on who is faster *)

val runBattle : Pocket_caml.t -> Pocket_caml.t -> Move.t
