type t
(** The type of a Caml or move *)

val effectiveness : t -> t -> int
(** effectiveness [move_type] [target_type] is the effectiveness of a move with
    type [move_type] against a caml of type [target_type] *)

val get_name : t -> string
(** Returns the name of a type. Only used for display purposes *)

val grass : t
val fire : t
val water : t

val makeCamlType : string -> t
(** Creates a new CamlType*)
