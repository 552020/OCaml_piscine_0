# OCaml Syntax Reference

Basic syntax and semantics for OCaml piscine module 0.

## Functions

Functions are defined using `let`[^1]. Arguments are separated by spaces (not commas or parentheses), and the function body comes after `=`. No curly brackets are needed.

[^1]: Other languages that use `let` for function definitions include F# (very similar to OCaml), Standard ML (SML), and Haskell (though Haskell uses it differently - `let` in expressions for local bindings, while top-level functions are usually defined without `let`). The ML family (OCaml, F#, SML) share this pattern because they come from the same functional programming tradition.

**Single argument:**
```ocaml
let ft_test_sign n =
  if n >= 0 then
    print_endline "positive"
  else
    print_endline "negative"
```

**Multiple arguments:**
```ocaml
let add x y = x + y
```

**Function calls:**

Function calls in OCaml don't require parentheses around arguments. Arguments are separated by spaces, not commas. For example: `ft_test_sign 42` or `add 5 10`. Parentheses are only needed in specific cases: when passing negative numbers (e.g., `ft_test_sign (-42)` to parse the negative number correctly), for grouping expressions or changing precedence, or when calling a function with no arguments using the unit value `()` (e.g., `some_function ()`). This minimal syntax is part of OCaml's design philosophy.

**Return values:**

OCaml functions don't use a `return` keyword. The value of the last expression in the function body is automatically returned. For example, in `let add x y = x + y`, the expression `x + y` is evaluated and its value is returned. In conditional expressions like `if ... then ... else ...`, the value of whichever branch executes is returned. This is similar to Rust, where the last expression (without a semicolon) is the return value. Unlike languages like C/Java that require explicit `return` statements, OCaml's implicit return makes the code more concise.

### Functions as Values

In OCaml, functions are first-class values. This means functions are treated just like any other value (integers, strings, etc.) - they can be passed as arguments, returned from functions, stored in variables, and created on the fly. This is why functions use the same `let` binding syntax as variables: `let add x y = x + y` binds the name `add` to a function value, just as `let x = 5` binds `x` to an integer value. The type system distinguishes them, not the syntax. This unified approach is a core design principle of the ML family of languages.

This is different from languages like C/Java where you'd write `int add(int x, int y) { ... }`. OCaml uses a more minimal syntax.

## Variables and Bindings

In OCaml, a **variable** is a name that refers to a value (like `x` in `let x = 5`), while a **binding** is the mechanism of associating that name with a value using `let`. In OCaml, all bindings (variables and functions) are created using `let` - there's no separate syntax for variables. When you define a binding that's part of a larger expression, you use `in` to separate the binding from the expression that uses it.

**When you DON'T need `in`:**
- When the `let` binding is the last/only thing in its scope (like top-level function definitions):
```ocaml
let ft_countdown n = ...
```

**When you DO need `in`:**
- When you have a `let` binding followed by more code that uses it:
```ocaml
let ft_print_alphabet () =
  let rec print_from_ascii n = ... in
  print_from_ascii (int_of_char 'a')
```

The `in` keyword separates the binding from the expression that follows. This is used for:
- Local function definitions inside other functions
- Local variable bindings inside functions
- Any nested `let` binding that's part of a larger expression

**Example with local variable:**
```ocaml
let calculate x =
  let doubled = x * 2 in
  doubled + 10
```

Here, `doubled` is a local variable that's only available after the `in` keyword, and it's used in the expression `doubled + 10`.

## Types

OCaml has a strong, static type system with type inference. You don't need to explicitly write types in most cases, but understanding type signatures is important.

### Type Inference

OCaml uses type inference (Hindley–Milner algorithm) to automatically determine types without requiring explicit type annotations. You can write functions without specifying types, and the compiler will infer them from context:

```ocaml
let ft_test_sign n =
  if n >= 0 then
    print_endline "positive"
  else
    print_endline "negative"
```

The compiler infers that `n` is `int` and the function type is `int -> unit` based on how it's used. You can optionally add explicit type annotations for clarity or documentation:

```ocaml
let ft_test_sign (n : int) : unit =
  if n >= 0 then
    print_endline "positive"
  else
    print_endline "negative"
```

But explicit types are not required. OCaml's type system is **static** (types are checked at compile time) and **strong** (strict type conversions, no implicit conversions between incompatible types), but type inference makes it convenient to use.

### Basic Types

- `int` - Integers (e.g., `42`, `-10`, `0`)
- `string` - Strings (e.g., `"hello"`, `"positive"`)
- `bool` - Booleans (`true`, `false`)
- `unit` - The unit type, similar to `void` in C. Has one value: `()`. Used for functions that perform side effects and don't return meaningful values.

### Function Type Signatures

Function types are written using the arrow `->`. The syntax is: `input_type -> return_type`.

**Examples:**
- `int -> unit` - A function that takes an `int` and returns `unit` (performs side effects)
  ```ocaml
  let ft_test_sign : int -> unit = fun n -> ...
  ```
- `int -> int` - A function that takes an `int` and returns an `int`
  ```ocaml
  let add_one : int -> int = fun x -> x + 1
  ```
- `int -> int -> int` - A function that takes two `int`s and returns an `int` (curried function)
  ```ocaml
  let add : int -> int -> int = fun x y -> x + y
  ```
- `string -> unit` - A function that takes a `string` and returns `unit`
  ```ocaml
  print_endline : string -> unit
  ```

The `->` is right-associative, so `int -> int -> int` means `int -> (int -> int)`, which represents currying: a function that takes an `int` and returns a function that takes an `int` and returns an `int`. See [Currying](currying.md) for more details.

## Program Entry Point

OCaml does not have a special "main" function like C, Java, or Python. Instead, top-level expressions in a `.ml` file are executed when the program runs. When you compile with `ocamlopt`, these top-level expressions become the entry point and execute in order from top to bottom.

The `let () = ...` pattern is commonly used to group entry point code:

```ocaml
let ft_test_sign n = ...

let () =
  ft_test_sign 42;
  ft_test_sign 0;
  ft_test_sign (-42)
```

Here, `()` is the unit type (like `void` in C, but it's a value), and the semicolons (`;`) sequence the expressions. This pattern makes it clear you're executing side effects and is the idiomatic OCaml way to organize entry point code. You could also write top-level expressions directly without `let () = ...`, but the pattern is conventional for clarity.

This is a language feature - OCaml's module system and evaluation semantics define that top-level expressions execute when the module loads. The compiler implements this by generating startup code that runs those expressions.

