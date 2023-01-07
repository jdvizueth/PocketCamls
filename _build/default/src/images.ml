open Unix

let human_caml_ansi = ref ANSITerminal.blue

let set_caml1_color color =
  match color with
  | "fire" -> human_caml_ansi := ANSITerminal.red
  | "grass" -> human_caml_ansi := ANSITerminal.green
  | "water" -> human_caml_ansi := ANSITerminal.blue
  | _ -> human_caml_ansi := ANSITerminal.white

let caml1 () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)\n\
    \    /--'/--\\  \\-'||\n\
    \   /        \\_/ / | \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'"

let caml1_battle_forme () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)\n\
    \    /--'/--\\  \\-'||\n\
    \   /        \\_/ / | \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'";
  print_endline "";
  print_endline "____________________"

let caml1_fighting1 () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)   o\n\
    \    /--'/--\\  \\-'||      o\n\
    \   /        \\_/ / |           o  \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'"

let caml1_fighting2 () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)       o\n\
    \    /--'/--\\  \\-'||   o      o\n\
    \   /        \\_/ / |               o  \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'"

let caml1_fighting3 () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)          o\n\
    \    /--'/--\\  \\-'||      o      o\n\
    \   /        \\_/ / |   o              o  \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'"

let caml1_fighting4 () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)             o\n\
    \    /--'/--\\  \\-'||  o      o      o\n\
    \   /        \\_/ / |      o              o  \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'"

let caml1_fighting5 () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)    o            o\n\
    \    /--'/--\\  \\-'||       o     o      o\n\
    \   /        \\_/ / |          o              o \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'"

let caml1_fighting6 () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)                            \n\
    \    /--'/--\\  \\-'||    o   o o   o  o   o   o \n\
    \   /        \\_/ / |                            \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'"

let caml1_fighting7 () =
  ANSITerminal.print_string [ !human_caml_ansi ]
    "               ,,__\n\
    \     ..  ..   / o._)            o              o   \n\
    \    /--'/--\\  \\-'||         o     o      o       \n\
    \   /        \\_/ / |      o            o           \n\
    \ .'\\  \\__\\  __.'.'\n\
    \   )\\ |  )\\ | \n\
    \   // \\\\ //\\\\\n\
    \  ||_  \\\\|_ \\\\_\n\
    \  '--' '--'''--'"

let caml1_attack_ani () =
  let ani_slow = 0.1 in
  caml1_fighting1 ();
  print_newline ();
  sleepf ani_slow;
  print_string "\x1b[2J";
  caml1_fighting2 ();
  print_newline ();
  sleepf ani_slow;
  print_string "\x1b[2J";
  caml1_fighting3 ();
  print_newline ();
  sleepf ani_slow;
  print_string "\x1b[2J";
  caml1_fighting4 ();
  print_newline ();
  sleepf ani_slow;
  print_string "\x1b[2J";
  let counter = 5 in
  let i = ref 0 in
  while !i < counter do
    caml1_fighting5 ();
    print_newline ();
    sleepf ani_slow;
    print_string "\x1b[2J";
    caml1_fighting6 ();
    print_newline ();
    sleepf ani_slow;
    print_string "\x1b[2J";
    caml1_fighting7 ();
    print_newline ();
    sleepf ani_slow;
    print_string "\x1b[2J";

    i := !i + 1
  done;
  caml1_battle_forme ();
  print_newline ()

let bot_caml_ansi = ref ANSITerminal.magenta

let set_caml2_color color =
  match color with
  | "fire" -> human_caml_ansi := ANSITerminal.red
  | "grass" -> human_caml_ansi := ANSITerminal.green
  | "water" -> human_caml_ansi := ANSITerminal.blue
  | _ -> human_caml_ansi := ANSITerminal.white

let caml2 () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \                        (_.o \\   ..    ..\n\
    \                         ||'-/  /--\\.'/--\\ \n\
    \                         | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                             _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n"

let caml2_battle_forme () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \                        (_.o \\   ..    ..\n\
    \                         ||'-/  /--\\.'/--\\ \n\
    \                         | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                            _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n\
    \                                                 \n\
    \                           ______________________"

let caml2_fighting1 () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \                    o   (_.o \\   ..    ..\n\
    \                 o       ||'-/  /--\\.'/--\\ \n\
    \              o          | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                            _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n"

let caml2_fighting2 () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \                 o      (_.o \\   ..    ..\n\
    \              o     o    ||'-/  /--\\.'/--\\ \n\
    \           o             | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                            _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n"

let caml2_fighting3 () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \              o         (_.o \\   ..    ..\n\
    \           o     o       ||'-/  /--\\.'/--\\ \n\
    \        o           o    | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                            _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n"

let caml2_fighting4 () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \           o            (_.o \\   ..    ..\n\
    \        o     o     o    ||'-/  /--\\.'/--\\ \n\
    \     o           o       | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                            _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n"

let caml2_fighting5 () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \        o           o   (_.o \\   ..    ..\n\
    \     o     o     o       ||'-/  /--\\.'/--\\ \n\
    \  o           o          | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                            _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n"

let caml2_fighting6 () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \                        (_.o \\   ..    ..\n\
    \  o  o  o  o  o  o  o    ||'-/  /--\\.'/--\\ \n\
    \                         | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                            _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n"

let caml2_fighting7 () =
  ANSITerminal.print_string [ !bot_caml_ansi ]
    "\n\
    \                         __,,           \n\
    \ o           o          (_.o \\   ..    ..\n\
    \    o     o     o        ||'-/  /--\\.'/--\\ \n\
    \       o           o     | | \\_/          \\ \n\
    \                         '.'.__  /_/___/ /'.    \n\
    \                              | /( |  ( \\    \n\
    \                              //  \\\\  // \\\\     \n\
    \                            _//    \\_// _||    \n\
    \                           '--'    ''--''--'  \n"

let caml2_attack_ani () =
  let ani_slow = 0.1 in
  caml2_fighting1 ();
  print_newline ();
  sleepf ani_slow;
  print_string "\x1b[2J";
  caml2_fighting2 ();
  print_newline ();
  sleepf ani_slow;
  print_string "\x1b[2J";
  caml2_fighting3 ();
  print_newline ();
  sleepf ani_slow;
  print_string "\x1b[2J";
  caml2_fighting4 ();
  print_newline ();
  sleepf ani_slow;
  print_string "\x1b[2J";
  let counter = 5 in
  let i = ref 0 in
  while !i < counter do
    caml2_fighting5 ();
    print_newline ();
    sleepf ani_slow;
    print_string "\x1b[2J";
    caml2_fighting6 ();
    print_newline ();
    sleepf ani_slow;
    print_string "\x1b[2J";
    caml2_fighting7 ();
    print_newline ();
    sleepf ani_slow;
    print_string "\x1b[2J";

    i := !i + 1
  done;
  caml2_battle_forme ();
  print_newline ()
