type t
(** The type representing a move *)

val max_pp : t -> int
(** Returns the maximum number of times a move can be used without healing *)

val move_power : t -> int
(** Returns the power stat of a move *)

val name : t -> string
(** Returns the name of a move *)