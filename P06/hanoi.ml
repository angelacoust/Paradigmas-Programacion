(* Nota: 8 *)

let move (ori, des) =
    if(ori = 1 && des = 2) then        "1 -> 2    3\n"
    else if(ori = 1 && des = 3) then   "1 ---2--> 3\n"
    else if(ori = 2 && des = 3) then   "1    2 -> 3\n"
    else if(ori = 3 && des = 1) then   "1 <--2--- 3\n"
    else if(ori = 2 && des = 1) then   "1 <- 2    3\n"
    else                               "1    2 <- 3\n"
;;

let otro ori des =

  match (ori, des) with
  | (1, 2) | (2, 1) -> 3
  | (1, 3) | (3, 1) -> 2
  | (2, 3) | (3, 2) -> 1
  | _ -> 1
;;
  

let rec hanoi n ori des = 
  if n = 0 || ori = des then "" else
  let otro = otro ori des in
  hanoi (n-1) ori otro ^ move (ori, des) ^ hanoi (n-1) otro des
;;


let print_hanoi n ori des =
  if n < 0 || ori < 1 || ori > 3 || des < 1 || des > 3
    then print_endline  " ** ERROR ** \n"
  else print_endline (" =========== \n" ^ hanoi n ori des ^ " =========== \n")
;;


  let rec nth_hanoi_move n nd ori des = 
    if nd = 1 then 
        if n = 1 then (ori, des) else failwith "Este movimiento no sirve"
    else  
        let mov = 1 lsl (nd - 1) -1 in 
        let otro = otro ori des in
        if n <= mov then
            nth_hanoi_move n (nd - 1) ori otro 
        else if n = 1 + mov then 
            (ori,des)
        else
            nth_hanoi_move (n - 1 - mov) (nd - 1) otro des
;; 
  
  let crono f x =
    let t = Sys.time () in
    let _ = f x in
    Sys.time () -. t
