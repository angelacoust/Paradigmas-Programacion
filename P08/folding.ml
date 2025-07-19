(* Nota: 10 *)

let i_prod lista =
  List.fold_left ( * ) 1 lista
;;

let f_prod lista =
  List.fold_left ( *. ) 1.0 lista 
;;

let lmin = function
  | [] -> raise (Failure "lmin")
  | h::t -> List.fold_left min h t 
;;

let min_max = function
  | [] -> raise (Failure "min_max")
  | h::t -> List.fold_left (fun (min_val, max_val) x -> (min min_val x, max max_val x)) (h, h) t
;;

let rev lista =
  List.fold_left (fun acc x-> x :: acc) [] lista
;;

let rev_append lista1 lista2 = 
  List.fold_left (fun acc x -> x :: acc) lista2 lista1 
;;

let rev_map f lista =
  List.fold_left ( fun acc x -> (f x) :: acc) [] lista
;;

let concat lista =
  List.fold_left ( ^ ) "" lista
;;