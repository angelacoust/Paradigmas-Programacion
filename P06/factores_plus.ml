(* Nota: 10. En la de factores tengo un 0 , así que solo subo el plus xD *)
   
let rec factorize_aux x divisor =
  if x = 1 then []
  else if x mod divisor = 0 then
    let rec count_factors x divisor count =
      if x mod divisor = 0 then count_factors (x/divisor) divisor (count+1)
      else (divisor, count,x)
    in
    let (factor,exp, rest) = count_factors x divisor 0 in
    if exp = 1 then (string_of_int factor)::factorize_aux rest divisor
    else (string_of_int factor ^ "^" ^ string_of_int exp) :: factorize_aux rest divisor
  else factorize_aux x (divisor+1)
;;

let factoriza x =
  if x = 0 then "0"
  else if x = 1 then "1"
  else if x = -1 then "(-1)"
  else
    let factors = if x < 0 then "(-1) * " ^ String.concat " * " (factorize_aux (-x) 2)
      else String.concat " * " (factorize_aux x 2)
    in
    factors
;;