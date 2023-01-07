module PC = PocketCaml
module T = Trainer

let fire_spit = Move.makeMove "Fire Spit" (CamlType.makeCamlType "fire") 5 10
let water_spit = Move.makeMove "Water Spit" (CamlType.makeCamlType "water") 5 10
let grass_spit = Move.makeMove "Grass Spit" (CamlType.makeCamlType "grass") 5 10
let kick = Move.makeMove "Kick" (CamlType.makeCamlType "grass") 25 10

let power_of_ocaml =
  Move.makeMove "Power of Ocaml" (CamlType.makeCamlType "fire") 50 10

let fire_caml =
  PocketCaml.makeCaml "Fire Caml" 100 100
    [ fire_spit; water_spit; grass_spit; kick ]
    10
    (CamlType.makeCamlType "fire")

let grass_caml =
  PocketCaml.makeCaml "Grass Caml" 100 100
    [ fire_spit; water_spit; grass_spit; kick ]
    10
    (CamlType.makeCamlType "grass")

let almighty_caml =
  PocketCaml.makeCaml "The Almighty Caml" 200 200
    [ fire_spit; water_spit; grass_spit; power_of_ocaml ]
    100
    (CamlType.makeCamlType "fire")

let ash_trainer =
  TrainerHuman.makeTrainer "Ash" [ fire_caml; grass_caml ] fire_caml

let blue_trainer =
  TrainerBot.makeTrainer "Blue" [ grass_caml; fire_caml ] grass_caml

let runDemo () =
  IntroState.display_intro ();
  TrainerHuman.add_caml (IntroState.get_player_trainer ()) almighty_caml;
  Images.set_caml1_color
    (CamlType.get_name
       (PC.caml_type
          (TrainerHuman.active_caml (IntroState.get_player_trainer ()))));
  Images.set_caml2_color
    (blue_trainer |> TrainerBot.active_caml |> PC.caml_type |> CamlType.get_name);
  BattleState.runBattle (IntroState.get_player_trainer ()) blue_trainer
