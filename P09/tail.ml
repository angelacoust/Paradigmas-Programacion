(* Nota: 5 *)

(*
let concat l =
  let rec aux acc = function
    [] -> acc
|   h::t -> aux (List.append acc h) t
  in aux [] l
*)

let concat l =
  let rec aux acc = function 
    | [] -> List.rev acc 
    | h::t -> aux (List.rev_append h acc) t
  in
  aux [] l
;;


(*
let rec front = function
  [] -> raise (Failure "front")
| h::[] -> []
| h::t -> h::front t
*)
let front lista =
  let rec aux acc = function
    | []  -> raise (Failure "front")
    | [_] -> List.rev acc 
    | h::t-> aux (h::acc) t
  in
  aux [] lista
;;


(*
let rec compress = function
h1::h2::t -> if h1 = h2 then compress (h2::t)
else h1 :: compress (h2::t)
| l -> l
*)
let compress lista =
  let rec aux h1 h2 t acc =
    match h1, h2, t with 
    | _, _, [] -> List.rev (h1::acc) 
    | _, h2, t when h1 = h2 -> aux h2 (List.hd t) (List.tl t) acc
    | _, h2, t -> aux h2 (List.hd t) (List.tl t) (h1::acc)
  in
  match lista with
  | [] -> [] 
  | [x]-> [x]
  | h1::h2::t -> aux h1 h2 t []
;;


(*
let rec ofo = function
  [] -> []
  | h::t -> h :: List.filter ((<>) h) (ofo t)
*)
let ofo lista =
  let rec aux seen acc = function
    | [] -> List.rev acc
    | h::t when List.mem h seen -> aux seen acc t
    | h::t -> aux (h::seen) (h::acc) t
  in
  aux [][] lista
;;


let fold_right' = List.fold_right (*ya era de recursion terminal *)
;;


(*
let rec sublists = function
  [] -> [[]]
  | h::t -> let st = sublists t in
      st @ List.map (fun l -> h::l) st;
*)
let sublists lista =
  let rec aux acc = function
    | []-> acc
    | h::t->
        let new_sublists = List.map (fun l -> h::l) acc in
        aux (acc @ new_sublists) t 
  in
  aux [[]] lista
;;