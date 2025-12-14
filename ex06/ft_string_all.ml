(*
 * Compile: ocamlopt ft_string_all.ml -o ft_string_all
 * Run: ./ft_string_all
 *)

(* (char -> bool) -> string -> int -> bool *)
let rec check_all (predicate : char -> bool) (str : string) (idx : int) : bool =
  let len = String.length str in
  if idx >= len then
    true
  else
    if predicate (String.get str idx) then
      check_all predicate str (idx + 1)
    else
      false

(* (char -> bool) -> string -> bool *)
let ft_string_all (predicate : char -> bool) (str : string) : bool =
  check_all predicate str 0

let is_digit c = c >= '0' && c <= '9'

let () =
  print_string "Test 1: ft_string_all is_digit \"0123456789\" = ";
  print_string (if ft_string_all is_digit "0123456789" then "true" else "false");
  print_char '\n';
  print_string "Test 2: ft_string_all is_digit \"O12EAS67B9\" = ";
  print_string (if ft_string_all is_digit "O12EAS67B9" then "true" else "false");
  print_char '\n'

