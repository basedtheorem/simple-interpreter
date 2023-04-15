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
  if tokenStr == "": return Token(kind: "", value: "")

  var matchedBounds: (int, int)
  var matched: bool

  for (token, pattern) in TokenPatterns:
    matchedBounds = findBounds(tokenStr, re(pattern))
    if matchedBounds[0] == -1:
      if (matchedBounds[1] + 1) == tokenStr.len:
        return Token(kind: token, value: tokenStr)




func analyse*(str: string): Deque[Token] =
  # Appends tokens, and returns a copy
  var token: Token
  for tokenStr, isSep in str.tokenize():
    token = matchToken(tokenStr)
    if isSep: continue # early cont. because whitespace is common
    if token.kind == "":
      raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")
    result.addLast(token)