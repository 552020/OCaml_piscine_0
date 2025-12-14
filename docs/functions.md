# Functions in OCaml

## Recursive Functions and the `rec` Keyword

In OCaml, to write a recursive function (a function that calls itself), you must use the `rec` keyword:

```ocaml
let rec function_name parameter =
  (* function body that can call function_name *)
```

**Why is `rec` needed?**

Unlike languages like C, Java, Python, or JavaScript where function names are automatically in scope within their own definition, OCaml's `let` bindings work differently. Without `rec`, the function name is not available in its own body because the binding hasn't been completed yet.

**Example without `rec` (won't work):**
```ocaml
let factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)  (* Error: factorial is not in scope *)
```

**Example with `rec` (correct):**
```ocaml
let rec factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)  (* Works: rec makes factorial available *)
```

The `rec` keyword tells OCaml to make the function name available within its own definition, enabling recursion. This is a design choice that makes the scoping rules explicit and prevents accidental recursion.

## Function Signatures and Currying

Functions with multiple arguments in OCaml are **curried** by default. For example, a function with type `int -> int -> int` is actually `int -> (int -> int)` - it takes one argument and returns a function that takes the next argument. When you call `ft_power 2 4`, OCaml treats it as `(ft_power 2) 4` - two sequential function applications. This enables partial application and is a fundamental feature of functional programming. See [Currying](currying.md) for more details.

## print_endline

`print_endline` is a built-in function that prints a string to standard output followed by a newline character. It has the type `string -> unit`, meaning it takes a string as input and returns `unit` (similar to `void` in C).

**Syntax:**
```ocaml
print_endline "string"
```

**Examples:**
```ocaml
print_endline "Hello, world!"
(* Output: Hello, world! *)

print_endline "positive"
(* Output: positive *)

let () = print_endline "OCaml is fun"
(* Output: OCaml is fun *)
```

## print_int

`print_int` is a built-in function that prints an integer to standard output without a newline. It has the type `int -> unit`, meaning it takes an integer as input and returns `unit`.

**Syntax:**
```ocaml
print_int integer_value
```

**Examples:**
```ocaml
print_int 42
(* Output: 42 (no newline) *)

print_int 0
(* Output: 0 (no newline) *)

let () = print_int 100
(* Output: 100 (no newline) *)
```

## print_char

`print_char` is a built-in function that prints a single character to standard output without a newline. It has the type `char -> unit`, meaning it takes a character as input and returns `unit`.

**Syntax:**
```ocaml
print_char 'c'
```

**Examples:**
```ocaml
print_char 'a'
(* Output: a (no newline) *)

print_char '\n'
(* Output: newline character *)

let () = print_char 'X'
(* Output: X (no newline) *)
```

**Note:** Unlike `print_endline`, both `print_int` and `print_char` do not automatically add a newline. You need to explicitly call `print_char '\n'` if you want a newline after printing an integer or character.

## char_of_int

`char_of_int` is a built-in function that converts an integer (ASCII value) to a character. It has the type `int -> char`, meaning it takes an integer as input and returns a character.

**Note on naming:** OCaml uses the `type_of_type` naming convention, meaning "convert from the second type to the first type." So `char_of_int` means "char from int" or "char derived from int" (int → char). The pattern is `destination_type_of_source_type`. This is why it's `char_of_int` rather than `char_to_int` - it follows the OCaml/ML convention of using "of" to mean "derived from."

**Syntax:**
```ocaml
char_of_int ascii_value
```

**Examples:**
```ocaml
char_of_int 97
(* Returns: 'a' (97 is the ASCII code for 'a') *)

char_of_int 65
(* Returns: 'A' (65 is the ASCII code for 'A') *)

char_of_int 122
(* Returns: 'z' (122 is the ASCII code for 'z') *)
```

## int_of_char

`int_of_char` is a built-in function that converts a character to its integer (ASCII value). It has the type `char -> int`, meaning it takes a character as input and returns an integer. This is the inverse operation of `char_of_int`.

**Syntax:**
```ocaml
int_of_char 'c'
```

**Examples:**
```ocaml
int_of_char 'a'
(* Returns: 97 *)

int_of_char 'A'
(* Returns: 65 *)

int_of_char 'z'
(* Returns: 122 *)
```

**Note:** `char_of_int` and `int_of_char` are inverse operations:
- `char_of_int 97` = `'a'`
- `int_of_char 'a'` = `97`

## String.length

`String.length` is a built-in function that returns the length of a string. It has the type `string -> int`, meaning it takes a string as input and returns an integer.

**Syntax:**
```ocaml
String.length "string"
```

**Examples:**
```ocaml
String.length "hello"
(* Returns: 5 *)

String.length ""
(* Returns: 0 *)

String.length "OCaml"
(* Returns: 5 *)
```

## String.get

`String.get` is a built-in function that returns the character at a specific index in a string. It has the type `string -> int -> char`, meaning it takes a string and an integer (index) as input and returns a character. String indices start at 0.

**Syntax:**
```ocaml
String.get string index
```

**Examples:**
```ocaml
String.get "hello" 0
(* Returns: 'h' *)

String.get "hello" 4
(* Returns: 'o' *)

String.get "OCaml" 2
(* Returns: 'a' *)
```

**Note:** The index must be within bounds (0 to `String.length str - 1`). Accessing an out-of-bounds index will raise an exception.
