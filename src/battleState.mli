type t
(** The start of the battle scene. Includes 2 players *)

val callCamls : unit -> unit
(** shows the camls on screen *)

val turn_human : TrainerHuman.t -> TrainerBot.t -> unit
(** Runs the turn when the human goes first. *)

val turn_bot : TrainerBot.t -> TrainerHuman.t -> unit
(** Runs the turn when the bot goes first *)

val callTurnState : t -> 'a
(** calls a Turn State depending on who is faster *)

val runBattle : TrainerHuman.t -> TrainerBot.t -> unit
(** Runs the battle *)