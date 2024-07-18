module Syntax where

data Expr
  = Var String
  | App Expr Expr
  | Lam String Expr
  deriving (Show, Eq)

data Type
  = TVar String
  | TArr Type Type
  deriving (Show, Eq)
