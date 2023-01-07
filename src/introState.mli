type t
(** The player's trainer *)

val display_intro : unit -> unit
(** [display_intro ] displays the intro sequence of Pocket Camls *)

val get_player_trainer : unit -> TrainerHuman.t
(** Returns a Trainer type representing the player's trainer *)