(* Nota: 10 *)

let validar_argumentos n peones =
  if n<1 then 
    raise (Invalid_argument "galopada")
  else
    let coordenada_valida (x, y) = x >= 1 && x <= n && y >= 1 && y <= n in
    let peones_unicos = List.sort_uniq compare peones in
    if List.length peones <> List.length peones_unicos || not (List.for_all coordenada_valida peones) then
      raise (Invalid_argument "galopada")
;;

let movimientos_posibles (x,y) n =
  let movimientos = [
    (x+2, y+1); (x+2, y-1);
    (x-2, y+1); (x-2, y-1);
    (x+1, y+2); (x+1, y-2);
    (x-1, y+2); (x-1, y-2)
  ]in
  List.filter (fun (a, b) -> a >= 1 && a <= n && b >= 1 && b <= n) movimientos
;;

let rec intentar_galopada n peones posicion_actual camino =
  match peones with
  | [] -> List.rev (posicion_actual:: camino) 
  | _ ->
    let posibles_movimientos = movimientos_posibles posicion_actual n in
    let validar_movimiento (nx, ny) =
      List.exists (fun (px,py) -> nx = px && ny = py) peones
    in
    let siguientes=List.filter validar_movimiento posibles_movimientos in
    let rec probar_movimientos movimientos_restantes =
      match movimientos_restantes with
      | [] -> raise Not_found
      | mov:: resto ->
        let peones_restantes = List.filter (fun p->p <> mov) peones in
        try
          intentar_galopada n peones_restantes mov (posicion_actual :: camino)
        with Not_found->probar_movimientos resto
    in
    probar_movimientos siguientes
;;

let galopada n peones =
  validar_argumentos n peones;
  let casillas_libres =
    List.init n (fun i -> List.init n (fun j -> (i+ 1, j +1))) 
    |> List.flatten 
    |> List.filter (fun c -> not (List.mem c peones)) 
  in
  let rec buscar_desde_casillas casillas =
    match casillas with
    | [] -> raise Not_found 
    | casilla::resto -> 
      try
        intentar_galopada n peones casilla []
      with Not_found -> buscar_desde_casillas resto 
  in
  buscar_desde_casillas casillas_libres
;;
