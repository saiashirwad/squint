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

- Functions

    ```typescript
    add = a b => a + b
    add = (a: Number) (b: Number) : Number => a + b
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

    type Node = T => {
        value: T,
        left: Tree T,
        right: Tree T
    }

    type Name = (T: String) => T

    type Tree = T => Empty | Node T
    ```

- Pattern Matching

    ```typescript
    result = match shape {
        Circle: (radius) => radius * radius * 3.14,
        Rectangle: ({width, height}) => width * height,
        _ => 0
    }
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
            map: (ma, f) => match ma {
                    Just: (a) => Just (f a),
                    Nothing: () => Nothing
                }
        },
        Monad: {
            pure: (a) => Just a,
            bind: (ma , f) => match ma {
                    Just: (a) => f a,
                    Nothing: () => Nothing
                }
        }
    }

    type SomeString = String with { Functor, Monad }
    ```
