(*
 * Compile: ocamlopt ft_print_comb.ml -o ft_print_comb
 * Run: ./ft_print_comb
 *)

(* unit -> unit *)
let ft_print_comb () =
  let rec loop_third first second third first_printed =
    if third <= 9 then
      (if first < second && second < third then
         (if first_printed then print_string ", " else ();
          print_int first;
          print_int second;
          print_int third;
          loop_third first second (third + 1) true)
       else
         loop_third first second (third + 1) first_printed)
    else
      first_printed
  in
  let rec loop_second first second first_printed =
    if second <= 9 then
      let updated_printed = loop_third first second 0 first_printed in
      loop_second first (second + 1) updated_printed
    else
      first_printed
  in
  let rec loop_first first first_printed =
    if first <= 9 then
      let updated_printed = loop_second first 0 first_printed in
      loop_first (first + 1) updated_printed
    else
      first_printed
  in
  let _ = loop_first 0 false in
  print_char '\n'

let () =
  ft_print_comb ()

