{.experimental: "strictFuncs".} # functions must be pure
import re, tokenize, deques, sequtils


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





func matchToken(tokenStr: string): Token =
  if tokenStr == "": return (tokenType: "", value: "")
  const TOKENPATTERNS = [ # const is evaluated at compile time
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
  var matchedBounds: (int, int)
  var matched: bool

  for tokenType in TOKENPATTERNS:
    matchedBounds = findBounds(tokenStr, re(tokenType[1]))

    if matchedBounds[0] == -1:
          matched = false
    else: matched = true

    if matched:
      if (matchedBounds[1] + 1) == len(tokenStr):
        return (tokentype[0], tokenStr)
      # part of token not matched
      raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")




#  Lexical layer  #
# --------------- #

func scanTokens(str: string): seq[Token] =
  # Appends tokens, and returns a copy
  var token: Token
  for tokenStr, isSep in str.tokenize():
    token = matchToken(tokenStr)
    if not isSep and token.tokenType == "":
      raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")
    elif not isSep:
      result.add(token)

# --------------- #




#  Syntax layer  #
# -------------- #

func getStatements(tokens: seq[Token]): (Deque[Deque[Token]],
                                         Deque[Token]) =
  var statements = initDeque[Deque[Token]](10)
  var leftover = initDeque[Token](10)

  for token in tokens:
    leftover.addLast(token)
    if token.tokenType == "end":
      statements.addLast(leftover)

  return (statements, leftover)




proc parseStatement(statement: Deque[Token]) =
  discard

# --------------- #

when isMainModule:
  var q = initDeque[Token](10)
  while true:
    let line: string = readLine(stdin)
    if line == "": continue

    try:
      let tokens: seq[Token] = scanTokens(line)
      var (statements, leftover) = getStatements(tokens)

      while statements.len() != 0:
        statements.popFirst().parseStatement()
      
      q = leftover
      echo q
      echo statements
    except ValueError:        
      echo getCurrentExceptionMsg() & "\nTry again.\n"
      q = initDeque[Token](10)