# OCaml_piscine_0

First module of the OCaml piscine at 42. Introduction to functional programming concepts through OCaml: values, types, operators, let bindings, functions, and recursion.

## About OCaml

OCaml is a functional programming language that is part of the ML family. The name "OCaml" stands for "Objective Caml" - it extends the original Caml language (which itself is derived from ML) with object-oriented features. OCaml was created by Xavier Leroy and others at INRIA (Institut national de recherche en informatique et en automatique) and was first released in 1996. ML (Meta Language) was originally developed in the 1970s at the University of Edinburgh for theorem proving. The ML family of languages, which includes Standard ML, OCaml, and F#, introduced many features that became standard in functional programming: pattern matching, type inference (Hindley–Milner), algebraic data types, first-class functions, and the `let` binding syntax.

The development of OCaml was motivated by the need to combine the safety and expressiveness of functional programming with object-oriented programming features, while maintaining strong type safety. The goal was to create a practical language suitable for both research and industrial applications, with efficient native code compilation. OCaml was designed to bridge the gap between academic functional languages and the needs of real-world software development, providing a type-safe language that could be used for systems programming, compiler development, and other performance-critical applications.

## Installation

The OCaml toolchain can be installed via `opam` (OCaml Package Manager) or through system package managers. The recommended approach is using `opam`:

1. Install `opam` (if not already installed)
2. Initialize `opam`: `opam init`
3. Create a switch: `opam switch create <switch-name> <ocaml-version>` (e.g., `opam switch create 5.1.0`)
4. Activate the switch: `eval $(opam env)`

Alternatively, on macOS you can use Homebrew: `brew install ocaml`, or on Linux use your distribution's package manager (e.g., `apt-get install ocaml` on Debian/Ubuntu).

Verify the installation by checking `ocamlopt --version` and `ocamlc -where`.

## Visual Studio Code

**TL;DR** Install the packages `ocaml-lsp-server` and `ocamlformat` in your opam switch.

For VSCode, install the OCaml Platform Visual Studio Code extension from the Visual Studio Marketplace. The extension depends on OCaml LSP and OCamlFormat. To install them in your switch, you can run:

```bash
opam install ocaml-lsp-server ocamlformat
```

Upon first loading an OCaml source file, you may be prompted to select the toolchain in use. Pick the version of OCaml you are using, e.g., 5.1.0 from the list.

## Constraints

- Unless otherwise explicitly stated, the keywords `open`, `for` and `while` are forbidden. Their use will be flagged as cheating, no questions asked.
- Every output goes to the standard output, and will be ended by a newline, unless specified otherwise.

## Toolchain

Core toolchain (language + compilation):
- `ocaml` - Interactive toplevel (REPL)
- `ocamlc` - Bytecode compiler
- `ocamlopt` - Native-code compiler
- `ocamlrun` - Bytecode runtime
- `ocamldep` - Dependency analyzer
- `ocamlobjinfo` - Inspect compiled artifacts
- `ocamlprof` - Profiling support

Standard runtime and libraries:
- OCaml runtime system (GC, scheduler, memory model) - typically installed in `bin/` directory (e.g., `/usr/local/bin/ocamlrun`)
- OCaml standard library (Stdlib and core modules) - typically installed in `lib/ocaml/` directory (e.g., `/usr/local/lib/ocaml`). Use `ocamlc -where` to find the exact location on your system

Supporting system tools:
- System C compiler and linker (gcc or clang)
- Assembler and linker (invoked by ocamlopt)

For this piscine, we use `ocamlopt` as specified in the subject.

## Compilation Model

### What an OCaml installation contains

**Frontend (shared by ocamlc and ocamlopt):**
- Lexer and parser
- Type checker (Hindley–Milner + extensions)
- Module system (signatures, functors)

**Backends:**
- **Bytecode backend** (used by `ocamlc`): Generates bytecode instructions that run on the OCaml virtual machine (`ocamlrun`)
- **Native backend** (used by `ocamlopt`): Generates native assembly, performs optimizations (inlining, unboxing, etc.), uses the system assembler and linker

**Runtimes:**
- Bytecode runtime (`ocamlrun`)
- Native runtime (linked directly into native binaries)

**Standard library:**
- Pervasives / Stdlib (basic types, I/O, exceptions)
- Data structures (List, Array, Map, Set, Hashtbl)
- Modules for files, strings, math, etc.
- Automatically linked unless you opt out

### How compilation works

**Bytecode:**
- `ocamlc hello.ml → hello.byte`
- `hello.byte` is executed by `ocamlrun` (implicitly)

**Native:**
- `ocamlopt hello.ml → hello`
- `hello` is a standalone native executable

### Intermediate artifacts

Files generated during compilation:
- `.cmi` - Compiled interface (type information)
- `.cmo` - Bytecode object
- `.cmx` - Native object
- `.o` - Native object file
- `.cma` - Bytecode library
- `.cmxa` - Native library

### What's not included

Not part of "OCaml itself" (installed separately, usually via opam):
- `dune` - Build system
- `utop` - Enhanced REPL
- `ocamlformat` - Formatter
- `merlin` / `ocaml-lsp-server` - Editor tooling

**Note:** `dune` is similar to `cargo` for Rust - it handles project structure, dependencies, and compilation orchestration. Unlike C/C++ which have fragmented build systems (Make, CMake, Autotools, etc.), OCaml's `dune` is the standard, unified build system. However, for this piscine, we compile programs manually using `ocamlopt` directly, without using a build system like `dune`. The subject requires that you include everything necessary to compile a full executable that demonstrates your work.

---

## Appendix: Notable Functional Languages

Here are some of the most notable functional programming languages:

Pure functional:
- Haskell (1990): Pure functional, lazy evaluation, strong type system
- Elm (2012): Functional language for web frontend development
- PureScript (2013): Haskell-like language that compiles to JavaScript

Hybrid (functional + other paradigms):
- Scala (2004): Functional + object-oriented on the JVM
- F# (2005): Functional-first on .NET
- Clojure (2007): Functional Lisp on the JVM
- Erlang/Elixir (1986/2012): Functional languages designed for concurrency and fault tolerance

ML family:
- OCaml (1996): Functional + object-oriented, efficient native code compilation (the language used in this piscine)
- Standard ML (SML) (1990): Classic ML language
- F# (2005): Also part of ML family

Lisp family:
- Scheme/Racket (1975/1995): Minimalist functional languages
- Common Lisp (1984): Multi-paradigm language with functional roots

OCaml stands out among functional languages for its combination of functional and object-oriented features, strong type safety, and efficient native code compilation, making it particularly suitable for systems programming, compiler development, and performance-critical applications.
