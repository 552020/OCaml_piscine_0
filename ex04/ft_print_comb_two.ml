(*
 * Compile: ocamlopt ft_print_comb_two.ml -o ft_print_comb_two
 * Run: ./ft_print_comb_two
 *)

(* int -> int -> bool -> bool *)
let rec loop_second first second first_printed =
  if second <= 9 then
    (if first < second then
       (if first_printed then print_string ", " else ();
        print_int first;
        print_int second;
        loop_second first (second + 1) true)
     else
       loop_second first (second + 1) first_printed)
  else
    first_printed

(* int -> bool -> bool *)
let rec loop_first first first_printed =
  if first <= 9 then
    let updated_printed = loop_second first 0 first_printed in
    loop_first (first + 1) updated_printed
  else
    first_printed

(* unit -> unit *)
let ft_print_comb_two () =
  let _ = loop_first 0 false in
  print_char '\n'

let () =
  ft_print_comb_two ()

