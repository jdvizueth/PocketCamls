type t
(** The abstract type representing a Pocket Caml *)

val hp : t -> int
(** the current hp of the caml 
    [hp caml] is the current [hp] of [caml] *)

val max_hp : t -> int
(** the maximum hp of the caml
    [max_hp caml] is the maximum hp of [caml] *)

val speed : t -> int
(** returns the speed of a caml *)

val moves : t -> Move.t list
(** returns the moves of a caml *)

val caml_moves : t -> string
(** returns a string of the caml's moves *)
