#!/bin/bash
# Test suite for ft_test_sign using OCaml REPL

ocaml <<EOF
#use "ft_test_sign.ml";;
print_string "Test 1: ft_test_sign 42\n";;
ft_test_sign 42;;
print_string "Test 2: ft_test_sign 0\n";;
ft_test_sign 0;;
print_string "Test 3: ft_test_sign (-42)\n";;
ft_test_sign (-42);;
EOF

