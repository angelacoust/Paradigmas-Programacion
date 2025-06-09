(* Nota: 10 *)
let rec mcd x y =
  if y = 0 then x else mcd y (x mod y)
;;

let mcm x y =
  if x <= 0 || y <= 0 then
    -1  
  else
    let divisor = mcd x y in
    let cociente = x/divisor in
    if cociente > Int.max_int / y then
      -1  
    else
      cociente * y  (* Devuelve el MCM *)
;;


let mcm' x y =
  if x <= 0 || y <= 0 then
    -1
  else
    let divisor = mcd x y in
    let cociente = x/ divisor in
    if cociente > Int.max_int / y then
      -1
    else
      cociente * y
;;
