(*
 * Compile: ocamlopt ft_print_alphabet.ml -o ft_print_alphabet
 * Run: ./ft_print_alphabet
 *)

(* Old implementation using array:
let ft_print_alphabet () =
  let alphabet = [|'a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'|] in
  let rec print_from_index idx =
    if idx >= 0 then
      (print_from_index (idx - 1);
       print_char alphabet.(idx))
  in
  print_from_index (Array.length alphabet - 1);
  print_char '\n'
*)

let ft_print_alphabet () =
  let rec print_from_ascii n =
    if n <= (int_of_char 'z') then
      (print_char (char_of_int n);
       print_from_ascii (n + 1))
  in
  print_from_ascii (int_of_char 'a');
  print_char '\n'

(* Alternative approach using -1: start from 'z', go down to 'a',
 * and print on unwinding to get forward order *)
let invert () =
  let rec print_from_ascii n =
    if n >= (int_of_char 'a') then
      (print_from_ascii (n - 1);    (* Recurse down first *)
       print_char (char_of_int n))  (* Print on unwinding *)
  in
  print_from_ascii (int_of_char 'z');
  print_char '\n'

let () =
  ft_print_alphabet ();
  invert ()

