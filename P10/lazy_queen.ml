(* Nota: 3 *)
type posicion = int * int;;

exception Not_found;;


let costeh (x1, y1) (x2,y2) =
  if y1 = y2 then 
    abs (x2-x1) else max_int
;;

let costev (x1, y1) (x2, y2) =
  if x1 = x2 then 
    abs (y2-y1) else max_int
;;

let costed (x1, y1) (x2, y2) =
  if abs (x2-x1) = abs (y2-y1) then 
    abs (x2 -x1) else max_int
;;

let coste (x1, y1) (x2, y2) =
  let h = costeh (x1,y1) (x2,y2) in
  let v = costev (x1,y1) (x2,y2) in
  let d = costed (x1,y1) (x2,y2) in
  min h (min v d)
;;

let lazy_queen coste q_pos peones = 
  let rec buscar_camino actual_pos peones_acumulados visitados = 
    match peones_acumulados with
    | [] -> List.rev (actual_pos::visitados)  
    | _ ->
        let siguiente_peon =
          List.fold_left
            (fun (mejor_peon, menor_coste) peon -> 
              let c = coste actual_pos peon in
              if c < menor_coste then (peon,c) else (mejor_peon, menor_coste))
            ((-1,-1), max_int)
            peones_acumulados
        in 
        let (mejor_peon, menor_coste) = siguiente_peon in
        if mejor_peon = (-1, -1) || menor_coste = max_int then  
          raise Not_found
        else
          buscar_camino mejor_peon
            (List.filter (fun p->p <> mejor_peon) peones_acumulados) 
            (actual_pos::visitados)
  in
  buscar_camino q_pos peones [] 
;;