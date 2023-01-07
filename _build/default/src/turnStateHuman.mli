type t
(** The type representing the choices of a battle *)

val get_mv : PocketCaml.t -> int -> Move.t
(** Gets the move from a caml *)

val get_name_mv : Move.t -> string
(** Gets the name of a move *)

val total_dmg : PocketCaml.t -> Move.t -> int
(** Returns the total damage done by a move after applying effectiveness. Also
    returns a message that indicates the effectiveness of the move *)

val attack_success : PocketCaml.t -> PocketCaml.t -> bool -> Move.t -> unit

(** Describes if an attack was successful *)

val attack : PocketCaml.t -> Move.t -> unit
(** Deals damage to a PocketCaml [caml2] using move [mv] *)

val parse_fight : PocketCaml.t -> PocketCaml.t -> unit
(** Matches a move written to a move belonging to a caml, raises error if given
    anything other than a move from the caml *)

(*val callMoves : PocketCaml.t -> PocketCaml.t -> unit (** Show the move options
  and hide the previous options *) *)

val caml_call : TrainerHuman.t -> TrainerBot.t -> unit
(** Calls the active caml and continues to show the moves *)

val makeTurn : TrainerHuman.t -> TrainerBot.t -> unit
(** Makes a turn variant. Allows the player to make a decision to fight, run, or
    switch the active caml *)

val runTurnHuman : TrainerHuman.t -> TrainerBot.t -> unit
(** Runs the parts of a turn *)