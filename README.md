# I DON'T KNOW WHAT I'M DOING


## Language Goals

- Fun
- No Profit
- Compiles to Lua (so I can write my neovim config in it)
- Typeclasses and HKTs (for no reason at all)

## Syntax

- Basic

    ```typescript
    let name = "Hi"
    let ha = 234
    let something = true

    let names = ["Bob", "Alice", "Ted"]

    ```

- Tuples

    ```typescript
    let point = <2, 5>
    ```

- Functions

    ```typescript
    let add = (a, b) => a + b
    let add = (a: Number, b: Number) : Number => a + b
    ```

- Imperative Blocks

   ```typescript
   ```

- Types

    ```typescript
    type Person = {
        name: String,
        age: Number,
        email: String
    }

    type Point = { x: Number, y: Number}
    type Point = <Number, Number>

    type Shape = 
        | Circle Number
        | Rectangle <Number, Number>
        | Rectangle { width: Number, height: Number }
        | Point Point

    type Node = (T) => {
        value: T,
        left: Tree T,
        right: Tree T
    }

    type Name = (T: String) => T

    type Tree = (T) => Empty | Node T
    ```

- Pattern Matching

    ```typescript
    let result = match shape {
        Circle: (radius) => radius * radius * 3.14,
        Rectangle: ({width, height}) => width * height,
        _ => 0
    }

    let result = match shape {
        (radius: Number) => radius * radius * 3.14,
        ({ width: Number, height: Number}) => width * height,
        _ => 0
    }
    ```

- Typeclasses

    ```typescript
    typeclass Functor F = {
        map: (F(A), A => B) => F(B)
    }

    typeclass Monad (M: Functor) = {
        pure: A => M(A)
        bind: (M(A), A => M(B)) => M(B)
    }

    type Maybe A = Just A | Nothing
    with {
        Functor: {
            map: (ma: Maybe(A), f: A => B) => match ma {
                Just: (a) => Just (f a),
                Nothing: () => Nothing
            }
        },
        Monad: {
            pure: (a: A) => Just a,
            bind: (ma: Maybe(A), f: A => Maybe(B)) => match ma {
                Just: (a) => f a,
                Nothing: () => Nothing
            }
        }
    }

    alias SomeString2 = String

    type SomeString = String with { Functor, Monad }
    ```

## References
- https://learn.microsoft.com/en-us/dotnet/fsharp/language-reference/computation-expressions#creating-a-new-type-of-computation-expression
- https://wiki.haskell.org/Monad/ST
- https://agda.readthedocs.io/en/v2.5.2/language/mixfix-operators.html
- https://lptk.github.io/programming/2020/03/26/demystifying-mlsub.html
- https://lptk.github.io/files/[v8.0]%20mlstruct.pdf
- https://lptk.github.io/programming/2020/03/26/demystifying-mlsub.html#algebraic-subtyping-mlsub


## Notes
- DeBrujin + dependent types
