# Currying in OCaml

Currying is a fundamental concept in functional programming where a function that takes multiple arguments is transformed into a series of functions, each taking one argument.

## What is Currying?

In OCaml, when you write a function type like `int -> int -> int`, it's actually right-associative:

```
int -> (int -> int)
```

This means:
- The function takes an `int` (first argument)
- Returns a function of type `int -> int` (which takes the second argument and returns the result)

## Why Currying? The Fundamental Reason

At its core, currying is based on a fundamental mathematical principle: **in mathematics, a function always takes exactly one argument and returns exactly one value**. 

In mathematics, you don't have "functions with multiple arguments" - you have functions that return other functions. For example, the mathematical function f(x, y) = x + y is actually thought of as: f(x) returns a function g(y) = x + y, where x is "captured" from the outer function.

Currying makes programming functions match this mathematical model:
- Every function has the form: `input -> output`
- If you need "multiple arguments", you use: `input1 -> (input2 -> output)`
- This is just a function that returns a function

**The meaning:** Currying isn't just a convenience feature - it's a way to make programming functions align with the mathematical definition of functions. It reduces all functions to the simplest possible form: one input, one output. This uniformity makes the language more consistent, predictable, and mathematically sound.

**Why it matters:** This mathematical foundation enables:
- Functions to be treated uniformly (all functions work the same way)
- Easier mathematical reasoning about programs
- Natural function composition
- A simpler type system (all functions follow the same pattern)

## How It Works

When you call `ft_power 2 4`, OCaml treats it as two function applications:

1. `ft_power 2` - applies `ft_power` to `2`, returning a function `int -> int`
2. `(ft_power 2) 4` - applies that returned function to `4`, returning the result

So `ft_power 2 4` is parsed as `(ft_power 2) 4` - two sequential function calls, not one call with two arguments.

## Partial Application

Currying enables partial application - you can apply a function to some of its arguments and get back a function:

```ocaml
let power_of_2 = ft_power 2  (* This gives you a function int -> int *)
power_of_2 4  (* This gives you 16 *)
```

This is equivalent to `ft_power 2 4`, but makes the two-step process explicit.

## Currying vs Non-Currying

**In OCaml (curried):**
```ocaml
let add x y = x + y  (* Type: int -> int -> int *)
add 2 3  (* Parsed as (add 2) 3 *)
```

**In C (not curried):**
```c
int add(int x, int y) { return x + y; }  /* Takes two arguments directly */
add(2, 3);  /* One function call with two arguments */
```

## Why Currying?

Currying is a mathematical principle (named after Haskell Curry) that:
- Makes partial application natural and automatic
- Enables function composition and higher-order functions
- Aligns with the mathematical view of functions
- Is a fundamental feature of functional programming languages

## Is Currying a Property of Functions or Types?

Currying is more tied to the **type system**:
- The type signature `int -> int -> int` explicitly represents currying
- The type system determines how function application works
- The arrow `->` in types represents the curried structure
- You can't have automatic currying without the type system supporting it

However, it also affects function implementation - in OCaml, all multi-argument functions are implemented as curried functions by default.

## Languages with Currying

- **OCaml, Haskell, F#**: Automatic currying (all functions are curried)
- **Elm**: Automatic currying (all functions are curried, similar to Haskell)
- **Scala**: Supports both curried and non-curried functions
- **JavaScript**: Can manually curry functions (libraries like Ramda provide currying utilities)

## Languages without Currying

- **C, C++**: Functions take multiple arguments directly (not curried)
- **Rust**: Functions take multiple arguments directly (not curried), though you can manually create curried functions using closures
- **Java**: Methods take multiple parameters directly
- **Python**: Functions take multiple arguments, though `functools.partial` allows manual partial application

In OCaml, currying is automatic and built into the language - it's how the compiler implements multi-argument functions.

---

## Appendix: Why Do Mathematical Functions Take Only One Argument?

You're right to question this - mathematics doesn't "prohibit" functions with multiple arguments. We could define f(x, y) = x + y as a function that takes two arguments directly. So why do mathematicians model multi-argument functions as single-argument functions that return functions?

**It's a design choice, not a limitation.** Mathematicians chose this model for several theoretical reasons:

### 1. Uniformity and Simplicity

By reducing all functions to the form `input -> output`, you get a uniform model. Every function works the same way - no special cases for "functions with 2 arguments" vs "functions with 3 arguments". This simplicity makes the theory cleaner and easier to reason about.

### 2. Function Composition

If all functions have the same form, composition becomes natural and uniform. You can always compose `f` and `g` if the output type of `g` matches the input type of `f`, regardless of how many "arguments" the original function conceptually had.

### 3. Theoretical Foundations

In set theory and category theory (the foundations of mathematics), functions are defined as mappings from one set to another. A function f: A → B maps elements of set A to elements of set B. To model f(x, y), you can either:
- Define it as f: (A × B) → C (a function from the Cartesian product)
- Or define it as f: A → (B → C) (a function that returns a function)

The second approach (currying) is often preferred because it fits better with the theoretical framework and enables more elegant proofs.

### 4. Partial Application and Flexibility

By modeling f(x, y) as f(x) returning a function, you naturally get partial application. You can fix x and get a function of y, which is useful in many mathematical contexts.

### 5. Higher-Order Functions

This model makes it natural to have functions that operate on functions, which is fundamental to functional analysis and other areas of mathematics.

**The point:** It's not that math "can't" have multi-argument functions - it's that mathematicians found it more useful to model them as single-argument functions. This choice provides theoretical elegance, uniformity, and enables powerful mathematical tools. Programming languages that use currying are adopting this same mathematical model.

---

## Appendix II: The Add Function Example

The mathematical function `f(x, y) = x + y` is the equivalent of the OCaml function `add x y = x + y`.

**Mathematical notation:**
```
f(x, y) = x + y
```

**OCaml equivalent:**
```ocaml
let add x y = x + y
(* Type: int -> int -> int *)
```

Both represent the same operation: taking two numbers and returning their sum.

**How currying models this - Decomposition:**

The function `f(x, y) = x + y` can be decomposed into two functions:

1. **First function `f(x)`:**
   - Takes the first argument `x`
   - Returns a function `g` that "remembers" `x`

2. **Second function `g_x(y)` (or `g(y)` with `x` captured):**
   - Takes the second argument `y`
   - Uses the `x` that was provided by `f(x)` (either as a parameter `g_x` or captured in closure `g`)
   - Returns `x + y`

**Step by step:**

Starting with: `f(x, y) = x + y`

We decompose it to:
- `f(x) = g_x` where `g_x` is a function parameterized by `x`
- `g_x(y) = x + y` (more precise mathematical notation, where `x` is a parameter)

**Note on notation:** In pure mathematics, you'd write `g_x(y) = x + y` to make it explicit that `g` depends on `x`. In programming (with closures), we write `g(y) = x + y` where `x` is "captured" from the outer function. Both represent the same concept: a function of `y` where `x` is fixed.

So:
- `f(2)` returns `g_2` where `g_2(y) = 2 + y` (or `g(y) = 2 + y` with `x = 2` captured)
- `g_2(3)` (or `g(3)`) returns `2 + 3 = 5`
- Therefore: `f(2)(3) = g_2(3) = 5`

**In OCaml, this is exactly what happens:**
- `add 2` returns a function that adds 2 to its argument (this is `g_2(y) = 2 + y`, or `g(y) = 2 + y` with `x = 2` captured via closure)
- `(add 2) 3` applies that function to 3, giving 5
- So `add 2 3` is parsed as `(add 2) 3`, which is `f(2)(3)`

**The key insight:** `f(x, y)` becomes `f(x)` which returns `g_x(y)` (or `g(y)` with `x` captured). In mathematics, we'd write `g_x(y) = x + y` to make the parameter explicit. In programming with closures, we write `g(y) = x + y` where `x` is captured from the outer scope. Both represent the same concept: a function of `y` where `x` is fixed.

**Example:**
```ocaml
let add x y = x + y

add 2 3  (* Returns 5 *)
(* This is equivalent to: *)
(add 2) 3  (* Returns 5 *)

(* Partial application: *)
let add_2 = add 2  (* Function that adds 2 *)
add_2 5  (* Returns 7 *)
add_2 10  (* Returns 12 *)
```

The mathematical function `f(x, y) = x + y` and the OCaml function `add x y = x + y` are the same concept, just expressed in different notations. Currying is how OCaml implements the mathematical model of functions.

