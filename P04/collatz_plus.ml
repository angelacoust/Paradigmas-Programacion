(* Nota: 10 *)

let f x = 
  if x mod 2= 0 then x / 2 else 3*x+1 
;;


let rec length_n_top_aux x (length, maximo) =
  if x = 1 then (length + 1, maximo)
  else let next = f x in
       length_n_top_aux next (length + 1, max maximo next)
;;


let length'n'top x =
  length_n_top_aux x (0, x)
;;
