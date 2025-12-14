# Flow Control in OCaml

## if-else

OCaml uses `if-then-else` expressions for conditional execution. Unlike many languages, `if` in OCaml is an expression (it returns a value), not just a statement.

**Syntax:**
```ocaml
if condition then
  expression1
else
  expression2
```

The `else` branch is mandatory in OCaml - every `if` must have an `else`. The value of whichever branch executes is returned.

**Examples:**
```ocaml
let ft_test_sign n =
  if n >= 0 then
    print_endline "positive"
  else
    print_endline "negative"
```

```ocaml
let max a b =
  if a > b then a else b
```

```ocaml
let abs x =
  if x < 0 then -x else x
```

### Chaining conditions

OCaml doesn't have an `elseif` or `elif` keyword. Instead, you chain `if-else` expressions by nesting them:

```ocaml
if condition1 then
  expression1
else if condition2 then
  expression2
else
  expression3
```

This is just chaining `if-else` expressions - there's no special `elseif` construct. The `else if` is actually `else` followed by another `if` expression.

**Example:**
```ocaml
let grade_letter score =
  if score >= 90 then "A"
  else if score >= 80 then "B"
  else if score >= 70 then "C"
  else "F"
```

