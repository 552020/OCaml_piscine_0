(*
 * Compile: ocamlopt ft_power.ml -o ft_power
 * Run: ./ft_power
 *)

(* int -> int -> int *)
let rec ft_power base exponent =
  if exponent = 0 then
    1
  else
    base * ft_power base (exponent - 1)
(*
 * Recursion trace for ft_power 2 4:
 * Going down: ft_power 2 4 -> 2 * ft_power 2 3 -> 2 * ft_power 2 2 -> 2 * ft_power 2 1 -> 2 * ft_power 2 0
 * Base case: ft_power 2 0 returns 1
 * Unwinding: 2 * 1 = 2, 2 * 2 = 4, 2 * 4 = 8, 2 * 8 = 16
 *)

let () =
  print_int (ft_power 2 4);
  print_char '\n';
  print_int (ft_power 3 0);
  print_char '\n';
  print_int (ft_power 0 5);
  print_char '\n'

