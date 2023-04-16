{.experimental: "strictFuncs".}
import re, tokenize, deques


type
  Token* = ref object
    kind*: string
    value*: string

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
  result = Token(kind: "", value: "")
  if tokenStr == "": return result
  var matchedBounds: (int, int)
  for (token, pattern) in TokenPatterns:
    matchedBounds = findBounds(tokenStr, re(pattern))
    if (matchedBounds[0] != -1) and
       (matchedBounds[1] + 1) == tokenStr.len:
      return Token(kind: token, value: tokenStr)




func analyse*(str: string): Deque[Token] =
  # Appends tokens, and returns a copy
  var token: Token
  for tokenStr, isSep in str.tokenize():
    if isSep: continue # early cont. because whitespace is common
    token = matchToken(tokenStr)
    if token.kind == "":
      raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")
    result.addLast(token)