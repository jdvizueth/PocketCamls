open Game

let play_game f = f

let rec prompt_start () =
  (* print_endline " ----------------------------- \n\ \ Type 'start' to play
     the game \n\ \ \n\ \ OR \n\ \ \n\ \ Type 'quit' to exit the game \n\ \
     -----------------------------"; *)
  ANSITerminal.print_string [ ANSITerminal.white ]
    " ----------------------------- \n Type '";
  ANSITerminal.print_string [ ANSITerminal.yellow ] "start";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "' to play the game \n\
    \                               \n\
    \              OR               \n\
    \                               \n\
    \ Type '";
  ANSITerminal.print_string [ ANSITerminal.yellow ] "quit";
  ANSITerminal.print_string [ ANSITerminal.white ]
    "' to exit the game  \n -----------------------------";
  print_string "\n > ";

  let input = read_line () in
  if String.lowercase_ascii input = "start" then (
    print_endline "\n Starting game . . .";
    for i = 0 to 5 do
      print_endline "\n *"
    done)
  else if String.lowercase_ascii input = "quit" then (
    ANSITerminal.print_string [ ANSITerminal.red ] "\n Quiting game . . . \n\n";
    exit 0)
  else (
    ANSITerminal.print_string [ ANSITerminal.red ] "\n Command: '";
    ANSITerminal.print_string [ ANSITerminal.red ] input;
    ANSITerminal.print_string [ ANSITerminal.red ] "' unknown \n\n";
    prompt_start ())

(** [main ()] prompts for the game to play, then starts it. *)
let main () =
  ANSITerminal.print_string [ ANSITerminal.red ]
    "\n\n\n\
     ██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗     ██████╗ █████╗ \
     ███╗   ███╗██╗     ███████╗\n\
     ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝    \
     ██╔════╝██╔══██╗████╗ ████║██║     ██╔════╝\n\
     ██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║       ██║     \
     ███████║██╔████╔██║██║     ███████╗\n\
     ██╔═══╝ ██║   ██║██║     ██╔═██╗ ██╔══╝     ██║       ██║     \
     ██╔══██║██║╚██╔╝██║██║     ╚════██║\n\
     ██║     ╚██████╔╝╚██████╗██║  ██╗███████╗   ██║       ╚██████╗██║  ██║██║ \
     ╚═╝ ██║███████╗███████║\n\
     ╚═╝      ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝        ╚═════╝╚═╝  \
     ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝\n\
    \  \n";
  prompt_start ();
  play_game (Demo.runDemo ())
(* ANSITerminal.print_string [ ANSITerminal.green ] "\n Game Unimplemented,\n
   check back soon :) \n\n" *)

(* Execute the game engine. *)
let () = main ()