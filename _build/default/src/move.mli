type t
(** The type representing a move *)

val makeMove : string -> CamlType.t -> int -> int -> t
(** [makeMove name typ pwr max_pp] creates a move with name [name], type [typ],
    power [pwr] (this affects the damage dealt), and max pp [max_pp] (this
    determines how many times you can use a move) *)

val max_pp : t -> int
(** Returns the maximum number of times a move can be used without healing *)

val move_type : t -> CamlType.t
(** Returns the power stat of a move *)

val name : t -> string
(** Returns the name of a move *)

val power : t -> int
(** Returns the power stat of a move *)