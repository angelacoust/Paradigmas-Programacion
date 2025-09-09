(* Nota: 3*)

exception Invalid_argument of string  (*Esto lo hago para que aparezcan las comillas de "move" cuando printeo las excepciones *)

let is_stable (left, center, right) =
  let all_discs = List.sort compare (left @ center @ right) in
  let expected_discs = List.init (List.length all_discs) (fun i -> i+1) in
  all_discs = expected_discs
  && List.for_all (fun peg -> peg = List.sort compare peg) [left; center; right]
;;

let all_states n =
  if n<0 then
    raise (Invalid_argument "n debe ser no negativo") 
  else
    let rec aux k =
      match k with
      | 0 -> [([], [], [])]
      | _ ->
          let sub_states = aux (k-1) in
          List.flatten (
            List.map (fun (left, center, right) ->
              [(k :: left, center, right); (left, k :: center, right); (left, center, k :: right)]
            )sub_states
          )
    in aux n
;;

type move = LtoC | LtoR | CtoL | CtoR | RtoL | RtoC
;;

let move (left, center, right) action =
  if not (is_stable (left, center, right)) then 
    raise (Invalid_argument "move")
  else
    match action with
    | LtoC -> (match left with 
               | [] -> raise (Invalid_argument "move")
               | x :: xs when center = [] || x < List.hd center-> (xs, x :: center, right)
               | _ -> raise (Invalid_argument "move"))
    | LtoR -> (match left with
               | [] -> raise (Invalid_argument "move") 
               | x :: xs when right = [] || x < List.hd right -> (xs, center, x :: right)
               | _ -> raise (Invalid_argument "move")) 
    | CtoL -> (match center with
               | [] -> raise (Invalid_argument "move")
               | x :: xs when left = [] || x < List.hd left -> (x :: left, xs, right)
               | _ -> raise (Invalid_argument "move"))
    | CtoR -> (match center with
               | [] -> raise (Invalid_argument "move")
               | x :: xs when right = [] || x < List.hd right -> (left, xs, x :: right)
               | _ -> raise (Invalid_argument "move"))
    | RtoL -> (match right with
               | [] -> raise (Invalid_argument "move")
               | x :: xs when left = [] || x < List.hd left -> (x :: left, center, xs)
               | _ -> raise (Invalid_argument "move"))
    | RtoC -> (match right with
               | [] -> raise (Invalid_argument "move") 
               | x :: xs when center = [] || x < List.hd center-> (left, x :: center, xs)
               | _ -> raise (Invalid_argument "move"))
;;

let move_sequence state moves =
  if not (is_stable state) then
     raise (Invalid_argument "move_sequence")
  else
    let rec aux current_state = function
      | [] -> current_state
      | m :: ms ->
          let next_state = try move current_state m with
            | Invalid_argument _-> raise (Invalid_argument "move_sequence")
          in aux next_state ms
    in aux state moves
;;
