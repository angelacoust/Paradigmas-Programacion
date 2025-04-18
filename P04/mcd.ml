(* Nota: 5 *)

let rec mcd x y =
  if x < 0 || y < 0 then raise (Failure "Los números deben ser no negativos")
  else if x = 0 then y
  else if y = 0 then x
  else if x > y then mcd (x mod y) y
  else mcd (y mod x) x
;;


let rec mcd' x y =
  if x = 0 then y
  else if y = 0 then x
  else mcd' (y mod x) x
;;