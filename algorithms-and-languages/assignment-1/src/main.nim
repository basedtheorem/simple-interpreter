{.experimental: "strictFuncs".} # functions must be pure
import re, tokenize, deques


echo """
----------------------------------------
 159.341 2023 Semester 1 | Assignment 1
 Submitted by Laurens Morales, 21011877
----------------------------------------
"""

type
  Token = tuple
    tokenType: string
    value: string

type
  Node = object

const TokenPatterns = [
  # const is evaluated at compile time
  ("literal", "\\\"[[:ascii:]]*\\\""),
  ("append", "append"),
  ("exit", "exit"),
  ("list", "list"),
  ("print", "print"),
  ("printlength", "printlength"),
  ("printwords", "printwords"),
  ("printwordcount", "rintwordcount"),
  ("reverse", "reverse"),
  ("set", "set"),
  ("constant", "SPACE|TAB|NEWLINE"),
  ("end", ";"),
  ("plus", "\\+"),
  ("id", "[a-zA-Z][a-zA-Z0-9_]*"),
]




#  Lexical layer  #
# --------------- #

func matchToken(tokenStr: string): Token =
  if tokenStr == "": return (tokenType: "", value: "")

  var matchedBounds: (int, int)
  var matched: bool

  for tokenType in TokenPatterns:
    matchedBounds = findBounds(tokenStr, re(tokenType[1]))
    if matchedBounds[0] == -1:
      matched = false
    else:
      matched = true
    if matched:
      if (matchedBounds[1] + 1) == len(tokenStr):
        return (tokentype[0], tokenStr)
      # part of token not matched
      raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")


func scanTokens(str: string): seq[Token] =
  # Appends tokens, and returns a copy
  var token: Token

  for tokenStr, isSep in str.tokenize():
    token = matchToken(tokenStr)
    if not isSep and token.tokenType == "":
      raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")
    elif not isSep:
      result.add(token)


func getStatements(tokens: Deque[Token]):
      (Deque[Deque[Token]], Deque[Token]) =

  var statements = initDeque[Deque[Token]](2)
  var leftover: Deque[Token]

  for token in tokens:
    leftover.addLast(token)
    if token.tokenType == "end":
      statements.addLast(leftover)
      leftover.clear()

  return (statements, leftover)

# --------------- #




#  Syntax layer  #
# -------------- #

func parseAssignment(token: Token) =
  discard

func parseStatement(statement: Deque[Token]) =
  var statement = statement
  var token = statement.popFirst()

  case token.tokenType
  of "append", "set":
    parseAssignment(token)
  of "list", "exit":
    discard
  of "print", "printlength", "printwords", "printwordcount":
    discard
  of "reverse":
    discard
  else:
    discard

# --------------- #




when isMainModule:
  var q = initDeque[Token](10)
  var statements: Deque[Deque[Token]]

  while true:
    let line: string = readLine(stdin)
    if line == "": continue

    try:
      let tokens: seq[Token] = scanTokens(line)
      for token in tokens: q.addLast(token)
      (statements, q) = getStatements(q)
      while statements.len() != 0:
        statements.popFirst().parseStatement()

    except ValueError:        
      echo getCurrentExceptionMsg() & "\nTry again.\n"
      q.clear()