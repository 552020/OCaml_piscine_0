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

### Functions as Values

In OCaml, functions are first-class values. This means functions are treated just like any other value (integers, strings, etc.) - they can be passed as arguments, returned from functions, stored in variables, and created on the fly. This is why functions use the same `let` binding syntax as variables: `let add x y = x + y` binds the name `add` to a function value, just as `let x = 5` binds `x` to an integer value. The type system distinguishes them, not the syntax. This unified approach is a core design principle of the ML family of languages.

This is different from languages like C/Java where you'd write `int add(int x, int y) { ... }`. OCaml uses a more minimal syntax.

