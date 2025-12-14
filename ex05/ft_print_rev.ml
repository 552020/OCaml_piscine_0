(*
 * Compile: ocamlopt ft_print_rev.ml -o ft_print_rev
 * Run: ./ft_print_rev
 *)

(* string -> unit *)
let rec print_from_index str idx =
  if idx >= 0 then
    (print_char (String.get str idx);
     print_from_index str (idx - 1))

let ft_print_rev str =
  let len = String.length str in
  if len > 0 then
    print_from_index str (len - 1);
  print_char '\n'

let () =
  ft_print_rev "Hello world !";
  ft_print_rev ""

