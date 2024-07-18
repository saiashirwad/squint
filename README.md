# I DON'T KNOW WHAT I'M DOING

## Language Goals

- Fun
- No Profit

## Syntax

- Basic

    ```typescript
    name = "Hi"
    ha = 234
    something = true

    names = ["Bob", "Alice", "Ted"]
    ```

- Types

    ```typescript
    type Person = {
        name: String,
        age: Number,
        email?: String
    }

    type Point = { x: Number, y: Number}

    type Shape = 
        | Circle Number
        | Rectangle { width: Number, height: Number}
        | Point // shorthand for Point Point

    type Node T = {
        value: T,
        left: Tree T,
        right: Tree T
    }

    type Name (T: String) = T

    type Tree (T: Any) = Empty | Node Node T
    ```

- Typeclasses

    ```typescript
    typeclass Functor F = {
        map: (F A, A => B) => F B
    }

    typeclass Monad (M: Functor) = {
        pure: A => M A
        bind: (M A, A => M B) => M B
    }

    type Maybe A = Just A | Nothing
    with {
        Functor: {
            map: (Maybe A, A => B) => Maybe B
        },
        Monad: {
            pure: A => Maybe A,
            bind: (Maybe A, A => Maybe B) => Maybe B
        }
    }

    type SomeString = String with { Functor, Monad }
    ```
