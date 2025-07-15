(* Nota: 10 *)

let mcd x y =
  let rec aux a b =
    if b = 0 then a else 
      aux b (a mod b)
  in
  if x <= 0 || y <= 0 then 
    raise (Invalid_argument "mcd: argumentos inválidos")
  else 
    aux x y
;;

let mcm' x y =
  if x <= 0 || y <= 0 then
    raise (Invalid_argument "mcm': argumento inválido")
  else
    let divisor = mcd x y in
    let cociente = x / divisor in
    if cociente > Int.max_int / y then
      raise (Invalid_argument "mcm': mcm excede max_int")
    else
      cociente * y
    ;;