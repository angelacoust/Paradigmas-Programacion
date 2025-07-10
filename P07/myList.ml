let hd l = 
  match l with
  | h::_ -> h
  | [] -> raise (Failure "hd")
;;

let tl l = 
  match l with
  | _::t -> t
  | [] -> raise (Failure "tl")
;;

let last l =
  match l with
  | [] -> raise (Failure "last")
  | h::t ->
      let rec aux last = function
        | [] -> last
        | h::t -> aux h t
      in aux h t
    ;;

let rec length l =
  match l with
  | [] -> 0
  | _::t -> 1 + length t
;;

let length' l =
  let rec aux acc = function
    | []-> acc
    | _::t -> aux (acc+1) t
  in aux 0 l
;;

let rec compare_lengths l1 l2 =
  match (l1, l2) with
  | ([], []) -> 0
  | (_::_, []) -> 1
  | ([], _::_) -> -1
  | (_::t1, _::t2) -> compare_lengths t1 t2
;;

let rec append l1 l2 = 
  match l1 with
  | [] -> l2
  | h::t -> h :: append t l2
;;

let rev_append l1 l2 =
  let rec aux acc = function
    | [] -> acc
    | h::t -> aux (h::acc) t
  in aux l2 l1
;;

let rev l =
  let rec aux acc = function
    | [] -> acc
    | h::t -> aux (h::acc) t
  in aux [] l
;;

let rec concat = function
  | [] -> []
  | h::t -> append h (concat t)
;;

let flatten = concat
;;

let init n f =
  if n<0 then raise (Invalid_argument "init")
  else
    let rec aux i acc =
      if i <0 then acc
      else aux (i - 1) (f i :: acc)
    in aux (n - 1) []
  ;;

let nth l n =
  if n < 0 then raise (Invalid_argument "nth")
  else
    let rec aux i = function
      | [] -> raise ( Failure "nth")
      | h::t -> if i=0 then h else aux (i-1) t
    in aux n l
  ;;

let rec map f = function
  | [] -> []
  | h::t -> (f h) :: map f t
;;

let rev_map f l =
  let rec aux acc = function
    | [] -> acc
    | h::t -> aux (f h :: acc) t
  in aux [] l
;;
 
let rec map2 f l1 l2 = 
  match (l1, l2) with 
  | ([], []) -> []
  | (a1::l1, a2::l2) -> (f a1 a2) :: map2 f l1 l2
  | _ -> invalid_arg "List.map2"
;;
let rec combine l1 l2 =
  match (l1, l2) with
  | ([], []) -> []
  | (h1::t1, h2::t2) -> (h1, h2) :: combine t1 t2
  | _ -> invalid_arg "List.combine"
;;

let rec split = function
  | [] -> ([], [])
  | (x, y)::t ->
      let (xs, ys) = split t in
      (x::xs, y::ys)
  ;;
let find f l =
  let rec aux = function
    | [] -> raise Not_found
    | h::t -> if f h then h else aux t
  in aux l
;;

let rec filter f = function
  | [] -> []
  | h::t -> if f h then h :: filter f t else filter f t 
;;

let filter' f l=
  let rec aux acc = function
    | [] -> rev acc 
    | h::t -> aux (if f h then h::acc else acc) t
  in aux [] l
;;

let rec partition f = function
  | [] -> ([], [])
  | h::t ->
      let (yes, no) = partition f t in
      if f h then
         (h::yes, no) 
      else 
          (yes, h::no)
  ;;

let partition' f l =
  let rec aux yes no = function
    | [] -> (rev yes,rev no)
    | h::t -> if f h then aux (h::yes) no t else aux yes (h::no) t
  in aux [] [] l
;;

let rec for_all f = function
  | [] -> true
  | h::t -> f h && for_all f t
;;

let rec exists f = function
  | [] -> false
  | h::t -> f h || exists f t
;;

let rec mem x = function
  | [] -> false
  | h::t -> h = x || mem x t 
;;

let rec fold_left f acc = function
  | [] -> acc 
  | h::t -> fold_left f (f acc h) t
;;

let rec fold_right f l acc =
  match l with 
  | [] -> acc
  | h::t -> f h (fold_right f t acc)
;;