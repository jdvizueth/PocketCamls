let bar_width = 30

let player_health_bar name max_hp curr_hp =
  let percent_fill = float_of_int curr_hp /. float_of_int max_hp in
  let bar_fill = int_of_float (percent_fill *. float_of_int bar_width) in

  ANSITerminal.print_string [ ANSITerminal.white ] "\n";

  (* If health is greater than 75% -> display in green

     If health between 25% and 75% -> display in yellow

     If health less than 25% -> display in red *)
  if percent_fill >= 0.75 then (
    (*GREEN*)
    ANSITerminal.print_string [ ANSITerminal.green ] "{";

    for i = 0 to bar_fill do
      ANSITerminal.print_string [ ANSITerminal.green ] "█"
    done;

    for i = 0 to bar_width - bar_fill do
      ANSITerminal.print_string [ ANSITerminal.black ] " "
    done;

    ANSITerminal.print_string [ ANSITerminal.green ]
      ("} HP: " ^ string_of_int curr_hp ^ "/" ^ string_of_int max_hp ^ "\n"))
  else if percent_fill > 0.25 then (
    (*YELLOW*)
    ANSITerminal.print_string [ ANSITerminal.yellow ] "{";

    for i = 0 to bar_fill do
      ANSITerminal.print_string [ ANSITerminal.yellow ] "█"
    done;

    for i = 0 to bar_width - bar_fill do
      ANSITerminal.print_string [ ANSITerminal.black ] " "
    done;

    ANSITerminal.print_string [ ANSITerminal.yellow ]
      ("} HP: " ^ string_of_int curr_hp ^ "/" ^ string_of_int max_hp ^ "\n"))
  else (
    (*RED*)
    ANSITerminal.print_string [ ANSITerminal.red ] "{";

    for i = 0 to bar_fill do
      ANSITerminal.print_string [ ANSITerminal.red ] "█"
    done;

    for i = 0 to bar_width - bar_fill do
      ANSITerminal.print_string [ ANSITerminal.black ] " "
    done;

    ANSITerminal.print_string [ ANSITerminal.red ]
      ("} HP: " ^ string_of_int curr_hp ^ "/" ^ string_of_int max_hp ^ "\n"));

  (* ########################################################## *)
  (*                        Print name                          *)
  (* ########################################################## *)
  ANSITerminal.print_string [ ANSITerminal.blue ] (name ^ "\n");
  ANSITerminal.print_string [ ANSITerminal.white ] "\n"

let enemy_health_bar name max_hp curr_hp =
  let percent_fill = float_of_int curr_hp /. float_of_int max_hp in
  let bar_fill = int_of_float (percent_fill *. float_of_int bar_width) in

  ANSITerminal.print_string [ ANSITerminal.white ] "\n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "                                                ";

  (* If health is greater than 75% -> display in green

     If health between 25% and 75% -> display in yellow

     If health less than 25% -> display in red *)
  if percent_fill >= 0.75 then (
    (*GREEN*)
    ANSITerminal.print_string [ ANSITerminal.green ]
      ("HP: " ^ string_of_int curr_hp ^ "/" ^ string_of_int max_hp ^ " {");

    for i = 0 to bar_fill do
      ANSITerminal.print_string [ ANSITerminal.green ] "█"
    done;

    for i = 0 to bar_width - bar_fill do
      ANSITerminal.print_string [ ANSITerminal.black ] " "
    done;

    ANSITerminal.print_string [ ANSITerminal.green ] "} \n")
  else if percent_fill > 0.25 then (
    (*Yellow*)
    ANSITerminal.print_string [ ANSITerminal.yellow ]
      ("HP: " ^ string_of_int curr_hp ^ "/" ^ string_of_int max_hp ^ " {");

    for i = 0 to bar_fill do
      ANSITerminal.print_string [ ANSITerminal.yellow ] "█"
    done;

    for i = 0 to bar_width - bar_fill do
      ANSITerminal.print_string [ ANSITerminal.black ] " "
    done;

    ANSITerminal.print_string [ ANSITerminal.yellow ] "} \n")
  else (
    (*RED*)
    ANSITerminal.print_string [ ANSITerminal.red ]
      ("HP: " ^ string_of_int curr_hp ^ "/" ^ string_of_int max_hp ^ " {");

    for i = 0 to bar_fill do
      ANSITerminal.print_string [ ANSITerminal.red ] "█"
    done;

    for i = 0 to bar_width - bar_fill do
      ANSITerminal.print_string [ ANSITerminal.black ] " "
    done;

    ANSITerminal.print_string [ ANSITerminal.red ] "} \n");

  (* ########################################################## *)
  (*                        Print name                          *)
  (* ########################################################## *)
  ANSITerminal.print_string [ ANSITerminal.white ]
    "                                                ";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "                            ";
  ANSITerminal.print_string [ ANSITerminal.magenta ] (name ^ "\n");
  ANSITerminal.print_string [ ANSITerminal.white ] "\n"

let start_battle () =
  for i = 0 to 4 do
    ANSITerminal.print_string [ ANSITerminal.white ] "\n "
  done;
  ANSITerminal.print_string [ ANSITerminal.green ]
    "\n\
    \  ██████╗ ███████╗ █████╗ ██████╗ ██╗   ██╗                     \n\
    \  ██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝                     \n\
    \  ██████╔╝█████╗  ███████║██║  ██║ ╚████╔╝                      \n\
    \  ██╔══██╗██╔══╝  ██╔══██║██║  ██║  ╚██╔╝                       \n\
    \  ██║  ██║███████╗██║  ██║██████╔╝   ██║       ██╗    ██╗    ██╗\n\
    \  ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝    ╚═╝       ╚═╝    ╚═╝    ╚═╝\n";
  ANSITerminal.print_string [ ANSITerminal.white ] "\n ";
  ANSITerminal.print_string [ ANSITerminal.yellow ]
    "\n\
    \                                                                    \n\
    \  ███████╗███████╗████████╗                                     \n\
    \  ██╔════╝██╔════╝╚══██╔══╝                                     \n\
    \  ███████╗█████╗     ██║                                        \n\
    \  ╚════██║██╔══╝     ██║                                        \n\
    \  ███████║███████╗   ██║       ██╗    ██╗    ██╗                \n\
    \  ╚══════╝╚══════╝   ╚═╝       ╚═╝    ╚═╝    ╚═╝                \n\
    \                                                                \n";
  ANSITerminal.print_string [ ANSITerminal.white ] "\n ";
  ANSITerminal.print_string [ ANSITerminal.red ]
    "\n\
    \  ███████╗██╗ ██████╗ ██╗  ██╗████████╗██╗                      \n\
    \  ██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝██║                      \n\
    \  █████╗  ██║██║  ███╗███████║   ██║   ██║                      \n\
    \  ██╔══╝  ██║██║   ██║██╔══██║   ██║   ╚═╝                      \n\
    \  ██║     ██║╚██████╔╝██║  ██║   ██║   ██╗ ";

  for i = 0 to 4 do
    ANSITerminal.print_string [ ANSITerminal.white ] "\n "
  done;
  ANSITerminal.print_string [ ANSITerminal.white ]
    "\n\
     –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––\n"

let battle_options () =
  ANSITerminal.print_string [ ANSITerminal.white ] "\n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n";
  ANSITerminal.print_string [ ANSITerminal.yellow ]
    "  * Available Actions *     \n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "     - FIGHT                    \n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "     - SWITCH                   \n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "     - RUN                     \n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n"

let print_choice_battle action =
  ANSITerminal.print_string [ ANSITerminal.white ] "\n";

  if String.lowercase_ascii action = "fight" then (
    ANSITerminal.print_string [ ANSITerminal.white ] "You chose to ";
    ANSITerminal.print_string [ ANSITerminal.yellow ]
      (String.uppercase_ascii action);
    ANSITerminal.print_string [ ANSITerminal.white ] " :)\n")
  else if String.lowercase_ascii action = "run" then (
    ANSITerminal.print_string [ ANSITerminal.white ] "You can't ";
    ANSITerminal.print_string [ ANSITerminal.yellow ]
      (String.uppercase_ascii action);
    ANSITerminal.print_string [ ANSITerminal.white ]
      " from a caml battle, you coward!\n")
  else (
    ANSITerminal.print_string [ ANSITerminal.white ] "You chose to ";
    ANSITerminal.print_string [ ANSITerminal.yellow ]
      (String.uppercase_ascii action ^ "\n"))

let rec display_lst lst =
  match lst with
  | [] -> ()
  | [ s ] ->
      ANSITerminal.print_string [ ANSITerminal.white ]
        ("     - " ^ String.uppercase_ascii s ^ "\n")
  | h :: t ->
      display_lst [ h ];
      display_lst t

let fight_options name fight_lst =
  ANSITerminal.print_string [ ANSITerminal.white ] "\n";
  ANSITerminal.print_string [ ANSITerminal.white ] "Go ";
  ANSITerminal.print_string [ ANSITerminal.blue ] name;
  ANSITerminal.print_string [ ANSITerminal.white ] "!\n\n";

  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n";
  ANSITerminal.print_string [ ANSITerminal.yellow ]
    "  * Available Moves *     \n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n";
  display_lst fight_lst;
  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n"

let print_fight_choice is_player p_caml e_caml move message =
  ANSITerminal.print_string [ ANSITerminal.blue ] "\n";
  if is_player then ANSITerminal.print_string [ ANSITerminal.blue ] p_caml
  else ANSITerminal.print_string [ ANSITerminal.magenta ] e_caml;
  ANSITerminal.print_string [ ANSITerminal.white ] " used ";
  ANSITerminal.print_string [ ANSITerminal.yellow ]
    (String.uppercase_ascii move);
  ANSITerminal.print_string [ ANSITerminal.white ] " on ";
  if is_player then ANSITerminal.print_string [ ANSITerminal.magenta ] e_caml
  else ANSITerminal.print_string [ ANSITerminal.blue ] p_caml;
  ANSITerminal.print_string [ ANSITerminal.blue ] "\n\n";
  ANSITerminal.print_string [ ANSITerminal.white ] (message ^ "\n");
  ANSITerminal.print_string [ ANSITerminal.white ]
    "\n\
     –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––\n"

let switch_options switch_lst =
  ANSITerminal.print_string [ ANSITerminal.white ] "\n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "Choose one of the following Camls: \n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n";
  ANSITerminal.print_string [ ANSITerminal.yellow ]
    "        * Camls *               \n";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n";
  display_lst switch_lst;
  ANSITerminal.print_string [ ANSITerminal.white ]
    "––––––––––––––––––––––––– \n"

let print_switch_choice name =
  ANSITerminal.print_string [ ANSITerminal.white ] "\n";
  ANSITerminal.print_string [ ANSITerminal.white ] "You switched to ";
  ANSITerminal.print_string [ ANSITerminal.blue ]
    (String.uppercase_ascii name ^ "\n");
  ANSITerminal.print_string [ ANSITerminal.white ]
    "\n\
     –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––\n"

let show_health_bars player hp1 enemy hp2 max_hp =
  player_health_bar player max_hp hp1;
  enemy_health_bar enemy max_hp hp2

let demo_battle name1 hp1 name2 hp2 max_hp =
  start_battle ();
  show_health_bars name1 hp1 name2 hp2 max_hp;
  battle_options ();
  print_choice_battle "Fight";
  fight_options "Grass Caml" [ "Kick"; "Grass Spit"; "Water Spit"; "Fire Spit" ];
  print_fight_choice true "Grass Caml" "Fire Caml" "Grass Spit"
    "It's not very effective...";
  show_health_bars name1 hp1 name2 90 max_hp;
  print_fight_choice false "Grass Caml" "Fire Caml" "Kick"
    "It's alright I guess";
  show_health_bars name1 60 name2 90 max_hp;
  battle_options ();
  print_choice_battle "Run";
  battle_options ();
  print_choice_battle "Switch";
  switch_options [ "Ash's Fire Caml" ];
  print_switch_choice "Ash's Fire Caml";
  show_health_bars "Ash's Fire Caml" 100 name2 90 max_hp;
  battle_options ()
