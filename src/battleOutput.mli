val start_battle : unit -> unit
(** Information that appears at the beginning of a new battle. Alerts the player
    that the battle has started and gives information about the enemy.*)

val show_health_bars : string -> int -> string -> int -> int -> unit
(** [show_health_bars player hp1 enemy hp2 max_hp] displays the player's and
    opponent's current hp status.

    [player]: name of the player's caml whose health is being displayed Ex)
    "Ash's Grass Caml"

    [hp1]: the hp of the player's caml

    [enemy]: name of the enemy's caml whose health is being displayed

    [hp2]: the hp of the enemy's caml

    [max_hp]: maximum hp *)

val battle_options : unit -> unit
(** [battle_options ()] displayers to the player the available list of actions
    they can choose for their next move

    Ex) Player chooses from "Fight", "Run", or "Switch" *)

val print_choice_battle : string -> unit
(** [print_choice action] displays a message corresponing to the action the
    player inputted to do next in the battle.

    Ex) print_choice "fight" would display "You chose to fight :)"

    [action]: the input given by the player *)

val fight_options : string -> string list -> unit
(** [fight_options name fight_lst] displays to the player the available list of
    fight actions their caml can perform

    [name]: The name of the caml currently fighting

    [fight_lst]: The list of fight moves the caml can use *)

val print_fight_choice : bool -> string -> string -> string -> string -> unit
(** [print_fight_choice is_player p_caml e_caml move message] displays which
    move the player's caml will use against the enemy's caml

    [is_player]: true = player chose the move, false = bot chose the move

    [p_caml]: the type of the player's caml to be displayed Ex) "Grass Caml"

    [e_caml]: the type of the enemy's caml to be displayed Ex) "Fire Caml"

    [move]: the type of move chosen by the player Ex) "Kick"

    [message]: message that indicates how effective the move was Ex) "It's
    alright I guess" *)

val switch_options : string list -> unit
(** [switch_options switch_lst] displays the available camls the player can
    switch to

    [switch_lst]: the list of camls available to switch to *)

val print_switch_choice : string -> unit
(** [print_switch_choice caml] displays which caml the player chose to switch to

    [name]: The name of the caml the player chose to switch to *)
