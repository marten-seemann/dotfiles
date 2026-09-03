---
name: write-clean-go
description: Write, fix, refactor, and review simple, idiomatic, encapsulated Go code. Use when changing or reviewing Go source, especially constructors, structs, package boundaries, APIs, concurrency, errors, and tests.
---

# Write Clean Go

Write straightforward Go that preserves type invariants and follows the repository's existing style.

## Rules

- Trace every caller and mutation before changing a type or shared function.
- Treat unexported struct fields as owned by the type. Code outside its constructors and methods must not read or mutate them directly, even from the same package.
- Treat unexported methods as internal to their receiver type: only other methods on that type may call them. The sole exception is an unexported method on an exported type that code elsewhere in the same package must call but callers outside the package must not.
- Pass required state to the constructor and return a fully initialized value. Never construct an object and then patch its unexported fields at the call site.
- Use a method for a legitimate post-construction state transition. Do not add trivial getters or setters merely to disguise external field access.
- When a type intentionally implements an interface, add a compile-time assertion directly below the struct definition, such as `var _ Interface = &Type{}`.
- Keep invariants in one place. Prefer one concrete type and direct control flow over speculative interfaces, helpers, or configuration.
- Use the standard library and existing repository patterns before adding code or dependencies.
- Scale variable names to their scope: the smaller the scope, the shorter the name. Use very short names in loops and short functions; use longer names when a larger or more complex scope needs clarity. For example, a connection might be `c` or `conn`, a session `s` or `sess`, and a listener `ln`.
- Use `&T{...}` for pointers to initialized struct literals. `new(T{...})` is not clean Go; reserve `new(T)` for allocating a zero value.
- Treat `t.Context()` as an anti-pattern in the vast majority of tests because it is canceled only after the test function returns. Use `context.Background()` in most cases; use `t.Context()` only when its cleanup-time cancellation is specifically needed.
- Format changed Go files and run the smallest relevant tests, then the broader affected package tests when practical.

## Review Check

Before finishing, search for direct field access on changed structs. Move any caller-owned initialization into the constructor and any valid mutation behind a behavior-named method.
