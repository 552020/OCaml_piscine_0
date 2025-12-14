(*
 * Compile: ocamlopt ft_rot_n.ml -o ft_rot_n
 * Run: ./ft_rot_n
 *)

(* int -> char -> char *)
let rotate_char (n : int) (c : char) : char =
  let ascii = int_of_char c in
  if c >= 'a' && c <= 'z' then
    (* Lowercase: 'a' = 97, 'z' = 122 *)
    let rotated = ((ascii - 97 + n) mod 26) + 97 in
    char_of_int rotated
  else if c >= 'A' && c <= 'Z' then
    (* Uppercase: 'A' = 65, 'Z' = 90 *)
    let rotated = ((ascii - 65 + n) mod 26) + 65 in
    char_of_int rotated
  else
    (* Non-alphabetical character, leave unchanged *)
    c

(* int -> string -> string *)
let ft_rot_n (n : int) (str : string) : string =
  String.map (rotate_char n) str

let () =
  print_string "Test 1: ft_rot_n 1 \"abcdefghijklmnopqrstuvwxyz\" = ";
  print_string (ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz");
  print_char '\n';
  print_string "Test 2: ft_rot_n 13 \"abcdefghijklmnopqrstuvwxyz\" = ";
  print_string (ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz");
  print_char '\n';
  print_string "Test 3: ft_rot_n 42 \"0123456789\" = ";
  print_string (ft_rot_n 42 "0123456789");
  print_char '\n';
  print_string "Test 4: ft_rot_n 2 \"OI2EAS67B9\" = ";
  print_string (ft_rot_n 2 "OI2EAS67B9");
  print_char '\n';
  print_string "Test 5: ft_rot_n 1 \"NBzlk qnbjr !\" = ";
  print_string (ft_rot_n 1 "NBzlk qnbjr !");
  print_char '\n'

