(* Nota: 9 *)

let pi = 3.14159265359;;

let e = 2.7182818284;;

let max_int_f = float_of_int max_int;;

let per r = 2. *. pi *. r;;

let area r = pi *. r ** 2.;;

let next_char c = char_of_int (int_of_char (c) + 1);;

let absf x = if x < 0. then x *. -1. else x;;

let odd x = if x mod 2 = 1 then true else false ;;

let next5mult x = ((x / 5) + 1) * 5;;

let is_letter x = (int_of_char x>64) = (int_of_char x <123);;

let string_of_bool x = if x = true then "verdadero" else "falso";;