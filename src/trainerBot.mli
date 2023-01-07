type t
(** The abstract type representing a Trainer Bot*)

val makeTrainer : string -> PocketCaml.t list -> PocketCaml.t -> t
(** Creates a new Bot Trainer with name [name], available camls [caml_list],
    active caml [active_pcaml] *)

val trainer_name : t -> string
(** The name of [trainer] *)

val caml_list : t -> PocketCaml.t list
(** The camls available to [trainer] *)

val active_caml : t -> PocketCaml.t
(** The active caml of [trainer] *)

val new_active_caml : t -> PocketCaml.t -> unit

val add_caml : t -> PocketCaml.t -> unit
(** Adds a new caml to the list of available camls to trainer.

    [trainer] is the trainer who gets the caml

    [caml] is the caml added *)

val str_camls : PocketCaml.t list -> string -> string
(** Strings the list of camls of the given caml list *)

val caml_name_list : PocketCaml.t list -> string list -> string list
(** Returns the names of the camls in the given caml list [trainer_camls] *)

val str_to_caml : PocketCaml.t list -> string -> PocketCaml.t
(** Returns the caml related to the given caml name [caml_name] in [caml_list].

    @raise [Not_found] if there is no caml with that name in [caml_list]*)

val active_camls : PocketCaml.t list -> int -> int
(** How many camls are still able to fight (i.e. how many have an hp value
    higher than 0) *)

val switch_caml : t -> unit
(** Switches the active caml of a Bot Trainer [trainer] to the next available
    one. *)

val has_lost : t -> unit
(** Checks if the Bot Trainer [trainer] has lost. If [trainer] has no more
    available camls, then declares the player the victor. Otherwise switches to
    the next available calm. *)
