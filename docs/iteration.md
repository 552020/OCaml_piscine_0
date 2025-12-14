# Iteration in OCaml

In programming, iteration (repeating operations) is typically done with loops like `for` and `while`. However, in OCaml and functional programming, **recursion** is used instead of loops.

## Why Recursion Instead of Loops?

OCaml does have `for` and `while` keywords, but **they are forbidden in this piscine**. The subject explicitly states: "Unless otherwise explicitly stated, the keywords `open`, `for` and `while` are forbidden. Their use will be flagged as cheating, no questions asked."

Even though OCaml supports loops, recursion is preferred because:
- **Functional programming style**: Recursion is the idiomatic way to iterate in functional languages
- **Immutability**: Recursion fits better with functional programming's emphasis on immutability and pure functions
- **Learning functional concepts**: This piscine focuses on functional programming principles

## Functional Languages and Loops

Some pure functional languages don't have `for` and `while` loops at all:

- **Haskell**: No built-in `for` or `while` loops. Iteration is done through recursion, higher-order functions (`map`, `fold`, `filter`), and list comprehensions. There are monadic loops in libraries (like `forM`), but they're not language-level constructs.
- **PureScript**: Similar to Haskell, no traditional loops.
- **Elm**: No `for`/`while` loops, uses recursion and higher-order functions.

Pure functional languages avoid imperative loops because loops rely on mutation and side effects, which conflict with immutability and pure functions.

**Languages that do have loops:**
- **OCaml**: Has `for` and `while` (imperative features, but forbidden in this piscine)
- **F#**: Has loops (supports both functional and imperative styles)
- **Scala**: Has loops (multi-paradigm language)
- **Erlang/Elixir**: Have some loop constructs, but recursion is preferred

So pure functional languages (like Haskell) don't have traditional loops at all - they use recursion and higher-order functions exclusively. OCaml is more pragmatic and includes imperative features like loops, but this piscine restricts their use to focus on functional programming principles.

## Recursion in OCaml

To write a recursive function in OCaml, you use the `rec` keyword:

```ocaml
let rec function_name parameter =
  (* base case *)
  if condition then
    base_value
  else
    (* recursive case *)
    function_name (modified_parameter)
```

The `rec` keyword tells OCaml that the function can call itself.

## Example: Countdown

Instead of a `for` loop like in C:
```c
for (int i = n; i >= 0; i--) {
    printf("%d\n", i);
}
```

In OCaml, you use recursion:
```ocaml
let rec ft_countdown n =
  if n < 0 then
    (print_int 0; print_char '\n')
  else
    (print_int n; print_char '\n';
     if n > 0 then ft_countdown (n - 1))
```

## Key Concepts

- **Base case**: The condition that stops the recursion (e.g., `n < 0`)
- **Recursive case**: The function calls itself with a modified parameter (e.g., `ft_countdown (n - 1)`)
- **Termination**: The recursive call must eventually reach the base case

Recursion is the functional programming way to achieve what loops do in imperative languages.

---

## Appendix: Why Pure Functional Languages Avoid Loops

Pure functional languages (like Haskell) don't have traditional `for` and `while` loops for several fundamental reasons:

### 1. Mutation and Mutable State

Traditional loops rely on mutable variables. For example, in a `for` loop:
```c
for (int i = 0; i < n; i++) {
    // i changes each iteration
}
```

The variable `i` is mutated (changed) each iteration. Pure functional languages emphasize **immutability** - once a value is bound, it doesn't change. This makes programs easier to reason about, test, and parallelize.

### 2. Side Effects

Loops often perform side effects (printing, modifying global state, I/O operations). In pure functional languages, side effects are handled explicitly through mechanisms like monads (in Haskell) or the type system, rather than being implicit in loop constructs.

### 3. Mathematical Foundation

Pure functional languages model computation as mathematical functions. In mathematics, you don't have "loops" - you have recursive definitions. For example, the factorial function is naturally defined recursively:
- `factorial(0) = 1`
- `factorial(n) = n * factorial(n-1)`

This mathematical foundation makes recursion a natural fit.

### 4. Composability and Higher-Order Functions

Instead of loops, pure functional languages use higher-order functions like `map`, `fold`, and `filter`. These functions:
- Are more composable (can be chained together)
- Are more declarative (describe *what* you want, not *how* to do it)
- Can be optimized by the compiler
- Work well with immutable data structures

For example, instead of:
```c
for (int i = 0; i < n; i++) {
    array[i] = array[i] * 2;
}
```

You'd use:
```haskell
map (*2) list
```

### 5. Referential Transparency

Pure functional languages value **referential transparency** - a function call with the same arguments always returns the same result, regardless of when or how many times it's called. Loops with mutable state break this property because the result depends on the current state of mutable variables.

### 6. Type Safety and Reasoning

Without mutable state in loops, the compiler can make stronger guarantees about program behavior. It's easier to prove properties about recursive functions than about loops with mutable state.

These principles make pure functional languages more predictable, testable, and mathematically sound, though they require a different way of thinking about iteration compared to imperative languages.

