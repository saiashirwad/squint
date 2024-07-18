# I DON'T KNOW WHAT I'M DOING

## Language Goals

- Fun
- No Profit
- Compiles to Lua (so I can write my neovim config in it)

## Syntax

- Basic

    ```typescript
    let name = "Hi"
    let ha = 234
    let something = true

    let names = ["Bob", "Alice", "Ted"]
    ```

- Functions

    ```typescript
    let add = (a, b) => a + b
    let add = (a: Number, b: Number) : Number => a + b
    ```

- Types

    ```typescript
    type Person = {
        name: String,
        age: Number,
        email: String
    }

    type Point = { x: Number, y: Number}

    let rect = <width, height>

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
        map: (ma: Maybe(A), f: A => B) => match ma {
            Just: (a) => Just (f a),
            Nothing: () => Nothing
        }
        pure: (a: A) => Just a,
        bind: (ma: Maybe(A), f: A => Maybe(B)) => match ma {
            Just: (a) => f a,
            Nothing: () => Nothing
        }
    }

    type SomeString = String with { Functor, Monad }
    ```

- Typeclasses (alternative syntax)

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
      @implement(Functor) = {
          map: (ma, f) => match ma {
              Just: (a) => Just (f a),
              Nothing: () => Nothing
          }
      }

      @implement(Monad) = {
           pure: (a) => Just a,
           bind: (ma, f) => match ma {
               Just: (a) => f a,
               Nothing: () => Nothing
           }
      }
    }

    type SomeString = String with { @deriving Functor, @deriving Monad }
    ```
