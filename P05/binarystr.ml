(* Nota: 10 *)

let rec binstr_of_int x =
  if x = 0 then "0"
  else if x = 1 then "1"
  else binstr_of_int (x/2) ^ string_of_int (x mod 2)
;;



let rec int_of_binstr s =
  let len = String.length s in
  let rec aux i acc =
    if i = len then acc
    else
      let bit = if s.[i] = '1' then 1 else 0 in
      aux (i+1) (2 * acc + bit)
  in
  aux 0 0
;;



let int_of_binstr' s =
  let cleaned = String.concat "" (String.split_on_char ' ' s) in
  int_of_binstr cleaned
;;