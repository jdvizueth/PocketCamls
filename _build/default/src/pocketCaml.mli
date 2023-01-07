type t
(** The abstract type representing a Pocket Caml *)

val makeCaml : string -> int -> int -> Move.t list -> int -> CamlType.t -> t
(** [makeCaml name max_hp hp moves spd typ] creates a new caml with max hp
    [max_hp] and current hp [hp], speed as [spd] and caml type [typ] (like fire,
    water, etc) *)

val hp : t -> int
(** The current hp of the caml [hp caml] is the current [hp] of [caml] *)

val max_hp : t -> int
(** The maximum hp of the caml [max_hp caml] is the maximum hp of [caml] *)

val set_hp : t -> int -> unit
(** Mutates the hp field of a caml to [hp]. If hp is negative, then it sets it
    to 0 *)

val speed : t -> int
(** Returns the speed of a caml *)

val moves : t -> Move.t list
(** Returns the moves of a caml *)

val caml_moves : t -> string list
(** Returns a string list of the caml's moves *)

val caml_type : t -> CamlType.t
(** Returns a representation of the caml's type *)

val pname : t -> string
(** Returns the name of a caml *)

val make_copy : string -> t -> t
(** Creates a new caml with the trainer's name and the same stats as the given
    caml. *)
