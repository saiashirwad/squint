module Parser where
import Text.Megaparsec (Parsec)
import Data.Void (Void)
import qualified Text.Megaparsec.Char.Lexer as L
import Text.Megaparsec.Char
import Control.Monad.Combinators
import Data.Char (digitToInt)

type Parser = Parsec Void String

spaceConsumer :: Parser ()
spaceConsumer = L.space space1 (L.skipLineComment "//") (L.skipBlockComment "/*" "*/") 

lexeme :: Parser a -> Parser a
lexeme = L.lexeme spaceConsumer

symbol :: String -> Parser String
symbol = L.symbol spaceConsumer

parens :: Parser a -> Parser a
parens = between (symbol "(") (symbol ")")

identifier :: Parser String
identifier = lexeme $ (:) <$> letterChar <*> many alphaNumChar

intParser :: Parser Int
intParser = read <$> many digitChar

pairParser :: Parser (Char, Int)
pairParser = (,) <$> letterChar <*> (digitToInt <$> digitChar)
