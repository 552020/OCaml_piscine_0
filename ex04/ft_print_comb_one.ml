(*
 * Compile: ocamlopt ft_print_comb_one.ml -o ft_print_comb_one
 * Run: ./ft_print_comb_one
 *)

(* unit -> unit *)
let rec loop n first_printed =
  if n <= 9 then
    (if first_printed then print_string ", " else ();
     print_int n;
     loop (n + 1) true)

let ft_print_comb_one () =
  loop 1 false;
  print_char '\n'

let () =
  ft_print_comb_one ()

