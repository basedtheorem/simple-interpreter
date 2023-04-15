
import re, tokenize, deques


type
  Token* = tuple
    kind: string
    value: string


const TokenPatterns = [
  # const is evaluated at compile time
  ("literal", "\\\"[[:ascii:]]*\\\""),
  ("assign", "append"),
  ("assign", "set"),
  ("key", "exit"),
  ("key", "list"),
  ("out", "print"),
  ("out", "printlength"),
  ("out", "printwords"),
  ("out", "rintwordcount"),
  ("reverse", "reverse"),
  ("end", ";"),
  ("plus", "\\+"),
  ("constant", "SPACE|TAB|NEWLINE"),
  ("id", "[a-zA-Z][a-zA-Z0-9_]*"),
]




func matchToken(tokenStr: string): Token =
  if tokenStr == "": return (kind: "", value: "")

  var matchedBounds: (int, int)
  var matched: bool

  for kind in TokenPatterns:
    matchedBounds = findBounds(tokenStr, re(kind[1]))
    if matchedBounds[0] == -1:
      matched = false
    else:
      matched = true
    if matched:
      if (matchedBounds[1] + 1) == tokenStr.len:
        return (kind[0], tokenStr)
      # part of token not matched
      raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")




func analyse*(str: string): Deque[Token] =
  # Appends tokens, and returns a copy
  var token: Token
  for tokenStr, isSep in str.tokenize():
    token = matchToken(tokenStr)
    if not isSep and token.kind == "":
      raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")
    elif not isSep:
      result.addLast(token)