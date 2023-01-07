(* Test plan: We are testing the individual parts of the caml battle using
   OUnit. However, since the overall game is interactive through the terminal,
   we test the final product manually. The game processes events (aka the turns
   and choices the player can make) in steps, so we test each step to ensure
   that each one produces an expected result. We developed test cases by looking
   for what modules are used and which functions get called throughout a game,
   and we test different possible values for those. For the most part, we used
   black-box testing, writing tests based on the documentation in the .mli
   files. However, sometimes knowing the spec (such as for constants defined in
   the modules) it is much easier to test by hardcoding certain values, which
   shouldn't change the validity of the tests, rather, it should just mean
   fewere helper functions are needed to extract values *)

open OUnit
open Game
module PC = PocketCaml
module TS = TurnState

let grass = 0
let fire = 1
let water = 2
let oneshot = 3
let grass_type = CamlType.grass
let fire_type = CamlType.fire
let water_type = CamlType.water
let types = [| grass_type; fire_type; water_type |]
(* different types can be accessed by using the int constants *)

let moves_list =
  Move.
    [|
      makeMove "Basic Grass Move" grass_type 10 10;
      makeMove "Basic Fire Move" fire_type 15 5;
      makeMove "Basic Water Move" water_type 5 15;
      makeMove "Serious Punch" grass_type 800 5;
    |]

let int_test name expected actual =
  name >:: fun _ -> assert_equal expected actual ~printer:string_of_int

let bool_test name expected actual =
  name >:: fun _ -> assert_equal expected actual ~printer:string_of_bool

let str_test name expected actual =
  name >:: fun _ ->
  assert_equal
    (String.lowercase_ascii expected)
    (String.lowercase_ascii actual)
    ~printer:Fun.id

let find_caml_helper name trainer caml_name =
  try
    let _ = TrainerHuman.str_to_caml (Trainer.caml_list trainer) caml_name in
    bool_test ("Fail! " ^ caml_name ^ " found...somehow?") true false
  with Not_found ->
    bool_test ("Success! No " ^ caml_name ^ " found!") true true

let move_name_tests =
  TS.
    [
      str_test "grass move" "Basic Grass Move" (get_name_mv moves_list.(grass));
      str_test "fire move" "Basic Fire Move" (get_name_mv moves_list.(fire));
      str_test "water move" "Basic Water Move" (get_name_mv moves_list.(water));
      str_test "opm move" "Serious Punch" (get_name_mv moves_list.(oneshot));
    ]

let basic_grass_caml =
  PC.makeCaml "Basic Grass Caml" 500 500 [ moves_list.(grass) ] 30 types.(grass)

let basic_fire_caml =
  PC.makeCaml "Basic Fire Caml" 500 500 [ moves_list.(fire) ] 20 types.(fire)

let basic_water_caml =
  PC.makeCaml "Basic Water Caml" 500 500 [ moves_list.(water) ] 10 types.(water)

let single_trainer =
  Trainer.makeTrainer "1 caml" [ basic_grass_caml ] basic_grass_caml

let double_trainer =
  Trainer.makeTrainer "2 camls"
    [ basic_grass_caml; basic_fire_caml ]
    basic_fire_caml

let triple_trainer =
  Trainer.makeTrainer "3 camls"
    [ basic_grass_caml; basic_fire_caml; basic_water_caml ]
    basic_fire_caml

let weak_grass =
  PC.makeCaml "weak fast grass" 10 10 [ moves_list.(grass) ] 30 types.(grass)

let mid_grass =
  PC.makeCaml "medium hp, medium spd grass" 20 20
    [ moves_list.(grass) ]
    20 types.(grass)

let stronk_grass =
  PC.makeCaml "strong slow grass" 50 50 [ moves_list.(grass) ] 5 types.(grass)

let grass_main =
  Trainer.makeTrainer "Grass Trainer"
    [ weak_grass; mid_grass; stronk_grass ]
    mid_grass

let caml_tests =
  [
    bool_test "water and fire are different types" false
      CamlType.(
        get_name (PC.caml_type basic_water_caml)
        = get_name (PC.caml_type basic_fire_caml));
    bool_test "water and grass are different types" false
      CamlType.(
        get_name (PC.caml_type basic_water_caml)
        = get_name (PC.caml_type basic_grass_caml));
    bool_test "grass and fire are different types" false
      CamlType.(
        get_name (PC.caml_type basic_grass_caml)
        = get_name (PC.caml_type basic_fire_caml));
    str_test "making a copy preserves type: grass"
      CamlType.(get_name (PC.caml_type basic_grass_caml))
      CamlType.(
        get_name PC.(basic_grass_caml |> make_copy "grass copy" |> caml_type));
    str_test "making a copy preserves type: fire"
      CamlType.(get_name (PC.caml_type basic_fire_caml))
      CamlType.(
        get_name PC.(basic_fire_caml |> make_copy "fire copy" |> caml_type));
    str_test "making a copy preserves type: water"
      CamlType.(get_name (PC.caml_type basic_water_caml))
      CamlType.(
        get_name PC.(basic_water_caml |> make_copy "water copy" |> caml_type));
  ]

let effectiveness_tests =
  [
    int_test "grass is super effective against water" 1
      CamlType.(effectiveness grass_type water_type);
    int_test "grass is NOT effective against fire" (-1)
      CamlType.(effectiveness grass_type fire_type);
    int_test "grass is eh against grass" 0
      CamlType.(effectiveness grass_type grass_type);
    int_test "fire is super effective against grass" 1
      CamlType.(effectiveness fire_type grass_type);
    int_test "fire is NOT effective against water" (-1)
      CamlType.(effectiveness fire_type water_type);
    int_test "fire is eh against fire" 0
      CamlType.(effectiveness fire_type fire_type);
    int_test "water is super effective against fire" 1
      CamlType.(effectiveness water_type fire_type);
    int_test "water is NOT effective against grass" (-1)
      CamlType.(effectiveness water_type grass_type);
    int_test "water is eh against water" 0
      CamlType.(effectiveness water_type water_type);
  ]

let dmg_tests =
  [
    int_test "super-effective dmg test, grass on water" 30
      (TurnState.total_dmg basic_water_caml moves_list.(grass));
    int_test "super-effective dmg test, water on fire" 15
      (TurnState.total_dmg basic_fire_caml moves_list.(water));
    int_test "super-effective dmg test, fire on grass" 45
      (TurnState.total_dmg basic_grass_caml moves_list.(fire));
    int_test "NOT effective dmg test, fire on water" 15
      (TurnState.total_dmg basic_water_caml moves_list.(fire));
    int_test "NOT effective dmg test, grass on fire" 10
      (TurnState.total_dmg basic_fire_caml moves_list.(grass));
    int_test "NOT effective dmg test, grass on fire" 5
      (TurnState.total_dmg basic_grass_caml moves_list.(water));
    int_test "neutral dmg test, grass on grass" 20
      (TurnState.total_dmg basic_grass_caml moves_list.(grass));
    int_test "neutral dmg test, water on water" 10
      (TurnState.total_dmg basic_water_caml moves_list.(water));
    int_test "neutral dmg test, water on water" 30
      (TurnState.total_dmg basic_fire_caml moves_list.(fire));
  ]

let atk_tests =
  let dummy_caml_base =
    PC.makeCaml "Basic Dummy Fire Caml" 500 500
      [ moves_list.(fire) ]
      20 types.(fire)
  in
  let dummy_maxhp = PC.max_hp dummy_caml_base in
  let dummy_super_eff = PC.make_copy "super" dummy_caml_base in
  TS.attack dummy_super_eff moves_list.(water);
  let dummy_eh_eff = PC.make_copy "eh" dummy_caml_base in
  TS.attack dummy_eh_eff moves_list.(fire);
  let dummy_not_eff = PC.make_copy "bad" dummy_caml_base in
  TS.attack dummy_not_eff moves_list.(grass);
  let dummy_dead = PC.make_copy "F" dummy_caml_base in
  TS.attack dummy_dead moves_list.(oneshot);
  [
    int_test "max hp is 500" 500 dummy_maxhp;
    int_test "dummy starting hp is max hp" dummy_maxhp (PC.hp dummy_caml_base);
    int_test "hp after super-effective"
      (dummy_maxhp - (3 * 5))
      (PC.hp dummy_super_eff);
    int_test "hp after eh-effective"
      (dummy_maxhp - (2 * 15))
      (PC.hp dummy_eh_eff);
    int_test "hp after not-effective" (dummy_maxhp - 10) (PC.hp dummy_not_eff);
    int_test "oneshot kills caml" 0 (PC.hp dummy_dead);
  ]

let trainer_tests =
  [
    int_test "single caml has 1 caml" 1
      (Trainer.caml_list single_trainer |> List.length);
    int_test "double caml has 2 camls" 2
      (Trainer.caml_list double_trainer |> List.length);
    int_test "triple caml has 3 camls" 3
      (Trainer.caml_list triple_trainer |> List.length);
    int_test "grass trainer also has 3 camls" 3
      (Trainer.caml_list grass_main |> List.length);
  ]

(* let battle_test_1 = let caml_sacrifice = PC.makeCaml "Basic Water Caml" 500
   10 [ moves_list.(water) ] 10 types.(water) in

   let playerL = Trainer.makeTrainer "gonna lose" [ caml_sacrifice ]
   caml_sacrifice in let caml_winner = PC.makeCaml "OPM" 5000 5000 [
   moves_list.(oneshot) ] 1000 types.(grass) in let oppW = Trainer.makeTrainer
   "gonna win" [ caml_winner ] caml_winner in TS.attack caml_sacrifice
   moves_list.(oneshot);

   [ bool_test "check for L" false (Trainer.(active_camls (caml_list playerL) 0)
   > 0); bool_test "check for W" false (Trainer.(active_camls (caml_list oppW)
   0) > 0); ] *)

let caml_all_moves =
  PC.makeCaml "god" 1000 1000 (Array.to_list moves_list) 1000 types.(grass)

let ts_get_mv_tests =
  [
    str_test
      (TS.get_name_mv moves_list.(grass))
      (TS.get_mv caml_all_moves grass |> TS.get_name_mv);
    str_test
      (TS.get_name_mv moves_list.(fire))
      (TS.get_mv caml_all_moves fire |> TS.get_name_mv);
    str_test
      (TS.get_name_mv moves_list.(water))
      (TS.get_mv caml_all_moves water |> TS.get_name_mv);
    str_test
      (TS.get_name_mv moves_list.(oneshot))
      (TS.get_mv caml_all_moves oneshot |> TS.get_name_mv);
  ]

let trainer_name_test exp_name trainer =
  str_test
    ("check trainer name: " ^ exp_name)
    exp_name
    (Trainer.trainer_name trainer)

let switch_active_caml_tests =
  let triple_trainer_copy =
    Trainer.makeTrainer "also 3 camls"
      [ basic_grass_caml; basic_fire_caml; basic_water_caml ]
      basic_fire_caml
  in
  Trainer.new_active_caml triple_trainer_copy basic_grass_caml;
  [
    (* str_test "triple trainer has default fire caml" "Basic Fire Caml"
       (Trainer.active_caml triple_trainer |> PC.pname); *)
    str_test "triple trainer copy has active grass caml" "Basic Grass Caml"
      (Trainer.active_caml triple_trainer_copy |> PC.pname);
    str_test "grass main has active mid grass caml"
      "grass trainer's weak fast grass"
      (Trainer.active_caml grass_main |> PC.pname);
  ]

let not_found_exns =
  [
    find_caml_helper "single trainer has no pikachu" single_trainer "pikachu";
    find_caml_helper "single trainer has no raichu" single_trainer "raichu";
    find_caml_helper "double trainer has no pikachu" double_trainer "pikachu";
    find_caml_helper "double trainer has no raichu" double_trainer "raichu";
    find_caml_helper "triple trainer has no pikachu" triple_trainer "pikachu";
    find_caml_helper "triple trainer has no raichu" triple_trainer "raichu";
  ]

let trainer_name_tests =
  [
    trainer_name_test "1 caml" single_trainer;
    trainer_name_test "2 camls" double_trainer;
    trainer_name_test "3 camls" triple_trainer;
    trainer_name_test "grass trainer" grass_main;
  ]

let tests =
  "test suite for Pocket Camls"
  >::: List.flatten
         [
           caml_tests;
           effectiveness_tests;
           dmg_tests;
           atk_tests;
           trainer_tests (* battle_test_1; *);
           move_name_tests;
           trainer_name_tests;
           switch_active_caml_tests;
           not_found_exns;
         ]

let _ = run_test_tt_main tests
