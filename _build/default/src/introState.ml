module PC = PocketCaml
module T = Trainer

type t = T.t

let fire_spit = Move.makeMove "Fire Spit" (CamlType.makeCamlType "fire") 5 10
let water_spit = Move.makeMove "Water Spit" (CamlType.makeCamlType "water") 5 10
let grass_spit = Move.makeMove "Grass Spit" (CamlType.makeCamlType "grass") 5 10
let kick = Move.makeMove "Kick" (CamlType.makeCamlType "grass") 25 10
let player_name = ref ""

let starting_caml =
  ref
    (PC.makeCaml "" 100 100
       [ fire_spit; water_spit; grass_spit; kick ]
       10
       (CamlType.makeCamlType "fire"))

let trainer = ref (TrainerHuman.makeTrainer "" [] !starting_caml)
let get_player_name () = !player_name
let get_player_trainer () = !trainer
let starting_camls_types = [ "Fire"; "Grass"; "Water" ]

let rec player_choice () =
  ANSITerminal.print_string [] "Pick your starting Caml: \n";
  ANSITerminal.print_string [ ANSITerminal.yellow ] "* GRASS\n";
  ANSITerminal.print_string [ ANSITerminal.yellow ] "* FIRE\n";
  ANSITerminal.print_string [ ANSITerminal.yellow ] "* WATER\n";
  ANSITerminal.print_string [] "> ";

  let caml_choice = read_line () in
  match String.lowercase_ascii caml_choice with
  | "fire" | "water" | "grass" -> caml_choice
  | _ ->
      ANSITerminal.print_string [] "Not a valid caml type, try again\n\n";
      player_choice ()

let gen_caml str =
  match String.lowercase_ascii str with
  | "grass" ->
      PC.makeCaml "Grass Caml" 100 100
        [ fire_spit; water_spit; grass_spit; kick ]
        10
        (CamlType.makeCamlType "grass")
  | "fire" ->
      PC.makeCaml "Fire Caml" 100 100
        [ fire_spit; water_spit; grass_spit; kick ]
        10
        (CamlType.makeCamlType "fire")
  | "water" ->
      PC.makeCaml "Water Caml" 100 100
        [ fire_spit; water_spit; grass_spit; kick ]
        10
        (CamlType.makeCamlType "water")
  | _ -> failwith "You shouldn't be here..."

let display_caml_color str =
  match String.lowercase_ascii str with
  | "grass" -> ANSITerminal.print_string [ ANSITerminal.green ] "GRASS CAML\n\n"
  | "water" -> ANSITerminal.print_string [ ANSITerminal.cyan ] "WATER CAML\n\n"
  | "fire" -> ANSITerminal.print_string [ ANSITerminal.red ] "FIRE CAML\n\n"
  | _ -> failwith "Wait, this wasn't suppossed to happen..."

let display_intro () =
  ANSITerminal.print_string [ ANSITerminal.white ]
    "\n\
     –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––\n";
  ANSITerminal.print_string [] "\n";
  ANSITerminal.print_string [ ANSITerminal.green ] "Input Trainer Name: ";
  let name = read_line () in
  player_name := name;
  ANSITerminal.print_string [] "\nWelcome, ";
  ANSITerminal.print_string [ ANSITerminal.blue ] !player_name;
  ANSITerminal.print_string [] "!\n\n";

  let caml_choice = player_choice () in
  starting_caml := gen_caml caml_choice;

  trainer :=
    TrainerHuman.makeTrainer !player_name [ !starting_caml ] !starting_caml;

  ANSITerminal.print_string [] "\n\n";
  ANSITerminal.print_string [] "Congratulations Trainer ";
  ANSITerminal.print_string [ ANSITerminal.blue ] !player_name;
  ANSITerminal.print_string [] "!\n";
  ANSITerminal.print_string [] "You have successfully equipped yourself with a ";
  display_caml_color caml_choice;

  ANSITerminal.print_string [] "You're ready to go to battle!\n";
  ANSITerminal.print_string [] "Watch out! Your first ";
  ANSITerminal.print_string [ ANSITerminal.magenta ] "OPPONENT ";
  ANSITerminal.print_string [] "has arrived!\n";
  ANSITerminal.print_string [] "Press ENTER to continue";
  ignore (read_line ())