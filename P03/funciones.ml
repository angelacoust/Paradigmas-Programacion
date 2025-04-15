(* Nota: 10 *)

let rec sumto x = if x <= 0 then 0 else x + sumto (x - 1);;

let rec exp2 x = if x = 0 then 1 else 2 * exp2 (x - 1);;

let rec num_cifras x = let x = abs x in if x < 10 then 1 else 1 + num_cifras (x / 10);;

let rec sum_cifras x = let x = abs x in if x < 10 then x else (x mod 10) + sum_cifras (x / 10);;