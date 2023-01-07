module PC = PocketCaml

type t = {
  pname : string;
  mutable caml_list : PC.t list;
  mutable active_pcaml : PC.t;
}

let makeTrainer pname caml_list active_pcaml : t =
  let rec list_of_copies (lst : PC.t list) acc : PC.t list =
    match lst with
    | [] -> List.rev acc
    | h :: t -> list_of_copies t (PC.make_copy pname h :: acc)
  in
  let caml_copies = list_of_copies caml_list [] in
  let actual_active_caml =
    if caml_list = [] then active_pcaml else List.hd caml_copies
  in
  { pname; caml_list = caml_copies; active_pcaml = actual_active_caml }

let trainer_name trainer = trainer.pname
let caml_list trainer = trainer.caml_list
let active_caml trainer = trainer.active_pcaml
let new_active_caml trainer caml = trainer.active_pcaml <- caml

let add_caml trainer caml =
  trainer.caml_list <- caml :: caml_list trainer |> List.rev

let rec str_camls (trainer_camls : PC.t list) (acc : string) =
  match trainer_camls with
  | [] -> "Camls : " ^ acc
  | h :: t -> str_camls t ("[ " ^ PC.pname h ^ " ]" ^ acc)

let rec caml_name_list trainer_camls acc : string list =
  match trainer_camls with
  | [] -> acc
  | h :: t -> caml_name_list t (PC.pname h :: acc)

let str_to_caml caml_list caml_name : PC.t =
  List.find (fun x -> PC.pname x = String.lowercase_ascii caml_name) caml_list

let rec active_camls trainer_camls acc : int =
  match trainer_camls with
  | [] -> acc
  | h :: t ->
      if PC.hp h > 0 then active_camls t (1 + acc) else active_camls t acc
