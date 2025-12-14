(*
 * Compile: ocamlopt ft_is_palindrome.ml -o ft_is_palindrome
 * Run: ./ft_is_palindrome
 *)

(* string -> int -> int -> bool *)
let rec check_palindrome (str : string) (left : int) (right : int) : bool =
  if left >= right then
    true
  else
    if String.get str left = String.get str right then
      check_palindrome str (left + 1) (right - 1)
    else
      false

(* string -> bool *)
let ft_is_palindrome (str : string) : bool =
  let len = String.length str in
  if len = 0 then
    true
  else
    check_palindrome str 0 (len - 1)

let () =
  print_string "Test 1: ft_is_palindrome \"radar\" = ";
  print_string (if ft_is_palindrome "radar" then "true" else "false");
  print_char '\n';
  print_string "Test 2: ft_is_palindrome \"madam\" = ";
  print_string (if ft_is_palindrome "madam" then "true" else "false");
  print_char '\n';
  print_string "Test 3: ft_is_palindrome \"car\" = ";
  print_string (if ft_is_palindrome "car" then "true" else "false");
  print_char '\n';
  print_string "Test 4: ft_is_palindrome \"\" = ";
  print_string (if ft_is_palindrome "" then "true" else "false");
  print_char '\n'

