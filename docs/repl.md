# OCaml REPL (Read-Eval-Print Loop)

The OCaml REPL (interactive interpreter) allows you to test code interactively. You can start it by running `ocaml` (or `utop` for an enhanced version).

## Starting the REPL

```bash
$ ocaml
        OCaml version 5.1.0

# 
```

The `#` is the REPL prompt, indicating you're in the interactive environment.

## Using the REPL

In the REPL, you can:
- Type expressions and see results immediately
- Test functions interactively
- See the inferred types of your code
- Explore the language

## REPL Syntax

- `;;` - Ends an expression in the REPL (required in REPL, but **never** used in `.ml` source files)
- The REPL shows the type and value of each expression

## Testing Your Functions

You can test functions in the REPL in two ways:

### Option 1: Type the function directly in the REPL

```ocaml
# let ft_test_sign n =
    if n >= 0 then
      print_endline "positive"
    else
      print_endline "negative";;
val ft_test_sign : int -> unit = <fun>

# ft_test_sign 42;;
positive
- : unit = ()
```

### Option 2: Load from a file

If you've written your function in a file (e.g., `ft_test_sign.ml`), you can load it in the REPL:

```ocaml
# #use "ft_test_sign.ml";;
val ft_test_sign : int -> unit = <fun>

# ft_test_sign 42;;
positive
- : unit = ()
```

**Important:** The REPL is for testing. Your actual submission is the `.ml` source file, not what you type in the REPL.

## Examples

When the subject says "Examples in the interpreter," it shows how to test your function. The examples demonstrate the expected behavior:

```ocaml
# ft_test_sign 42;;
positive
- : unit = ()

# ft_test_sign 0;;
positive
- : unit = ()

# ft_test_sign (-42);;
negative
- : unit = ()
```

The output `- : unit = ()` shows:
- `-` - The expression (no name since it's not bound to a variable)
- `: unit` - The type
- `= ()` - The value (the unit value)

## Why Use the REPL?

The REPL is useful for:
- Quick testing of functions
- Exploring the language
- Seeing type inference in action
- Debugging and experimentation

The subject provides REPL examples so you can verify your function works correctly interactively before submitting it.

## REPLs in Other Languages

Unlike OCaml, many compiled languages don't have official REPLs:

- **C/C++**: No REPL. Workflow is write → compile → run. You must compile your code before testing it.
- **Rust**: No official REPL. There are third-party tools like `evcxr` that provide a REPL-like experience, but it's not part of the standard Rust toolchain.

**Languages with REPLs:**
- OCaml (`ocaml`, `utop`)
- Python (`python`)
- JavaScript/Node.js (`node`)
- Haskell (`ghci`)
- Ruby (`irb`)
- Many functional and interpreted languages

**Why OCaml has a REPL:**

OCaml supports both compilation and interpretation. You can use the REPL for interactive testing and exploration, then compile with `ocamlopt` for production. This dual nature is common in functional languages (OCaml, Haskell, F#) because they support both interactive exploration and efficient compilation. The REPL is particularly valuable for functional languages because it helps you explore the type system and test functions interactively.

