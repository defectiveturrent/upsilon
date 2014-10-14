module Expressions where

import Data.Char
import Data.Maybe
import Data.List


-- Tokens data type
--
data Token
  = CONST Int  -- Numbers, const variables, etc
  | ID String  -- Variables, etc
  | STRING String
  | CHAR Char
  | PLUS
  | MINUS
  | MUL
  | DIV
  | GREATERTHAN
  | GREATEREQUAL
  | LESSTHAN
  | LESSEQUAL
  | EQUAL
  | NOT
  | MOD
  | ASSIGN
  | WITH
  | COMMA
  | CALLARGS
  | CALLALONE String
  | COMMENT
  | COUNTLIST
  | OPENPAREN
  | CLOSEPAREN
  | OPENBRACKETS
  | CLOSEBRACKETS
  | OPENKEYS
  | CLOSEKEYS
  | LAMBDA
  | IF
  | THEN
  | ELSE
  | WHILE
  | FOR
  | IN
  | WHEN
  | FUNC
  | TAKE
  | VOID
  | EOF  -- End of line
  deriving (Show, Read, Eq)


-- Ast ( Abstract syntax tree )
--
data Ast
  = Def Ast [Ast] Ast                  -- ID [ARGS] BODY
  | Assign Ast Ast                     -- Assign AST AST
  | Add Ast Ast                        -- Plus AST AST
  | Sub Ast Ast                        -- Minus AST AST
  | Mul Ast Ast                        -- Times AST AST
  | Div Ast Ast                        -- Divides AST AST
  | Grt Ast Ast                        -- Greater Than AST AST
  | Ge  Ast Ast                        -- Greater or equal AST AST
  | Let Ast Ast                        -- Less Than AST AST
  | Le  Ast Ast                        -- Less or equal AST AST
  | Equ Ast Ast                        -- Equal AST AST
  | Not Ast Ast                        -- Not equal AST AST
  | Mod Ast Ast                        -- Module AST AST
  | Take Ast Ast                       -- list take n
  | CountList Ast Ast                  -- CountList Ast Ast // [0..9]
  | Ident String                       -- VAR
  | CharString String                  -- A string
  | CharByte Char                      -- A character
  | Num Int                            -- NUMBER
  | ParenthesesBlock Ast               -- ( )
  | ComprehensionList [Ast]            -- ComprehensionList [DATES] // [1, 2, 3]
  | LambdaDef [Ast] Ast                -- LambdaDef [ARGS] BODY // {n = n + foo}
  | Call Ast [Ast]                     -- ID [ARGS]
  | Then Ast
  | Else Ast
  | Condition Ast Ast Ast              -- (Condition ast) (Then ast) (Else ast)
  | When Ast                           -- Simple condition
  | In Ast Ast                         -- Simple operator, like each
  | For Ast Ast Ast                    -- Specific comprehension list
  | Void
  | Eof
  deriving (Show, Read, Eq)