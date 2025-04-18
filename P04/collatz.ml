(* Nota: 10 *)

let rec f x = 
  if x mod 2 = 0 then x/2 else 3*x+1
;;


let rec verify x = 
  x = 1 || verify (f x)
;;


let rec verify_to x =
  if x = 1 then verify x
  else verify x && verify_to (x-1)
;;


let rec orbit_aux x acc =
  if x = 1 then acc ^ "1"
  else orbit_aux (f x) (acc ^ string_of_int x ^ ", ")
;;


let orbit x =
  orbit_aux x ""
;;


let rec length x =
  if x = 1 then 1
  else length (f x) + 1
;;


let rec top_aux x actual_max =
  if x = 1 then actual_max
  else let next = f x in
       top_aux next (max actual_max next)
;;


let top x =
  top_aux x x;;