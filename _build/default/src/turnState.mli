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