import re, tokenize, deques

# '*' means it is exported for other modules.
type
  Token* = ref object
    kind*: string
    value*: string

  TrackLiteral = object
    # This is used to toggle the tokenizer
    # depending on the state of the switch.
    str: string
    isOn: bool


const TokenPatterns = [
  # 'const' is evaluated at compile time.
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




proc matchToken(tokenStr: string): Token =
  result = Token(kind: "", value: "")
  if tokenStr == "": return result
  var matchedBounds: (int, int)
  for (token, pattern) in TokenPatterns:
    # Must match entire length of the token,
    # not just part of it.
    matchedBounds = findBounds(tokenStr, re(pattern))
    if (matchedBounds[0] != -1) and
       (matchedBounds[1] + 1) == tokenStr.len:
      return Token(kind: token, value: tokenStr)




var strBuilder = TrackLiteral(str: "", isOn: false)

proc analyse*(str: string): Deque[Token] =
  # Tokenizes string, appends tokens to a queue.
  # The variable 'result' is implicitly declared & returned.
  var token: Token
  for tokenStr, isSep in str.tokenize():
    if tokenStr == "": continue # prevents bug where "" becomes a token

    if strBuilder.isOn:
      strBuilder.str.add(tokenStr)
      if tokenStr[^1] == '"':
        strBuilder.isOn = false
        result.addLast(Token(kind: "literal", value: strBuilder.str))

    elif tokenStr[0] == '"' and # 'str[^1]' gets last char.
        (tokenStr[^1] != '"' or tokenStr.len == 1):
      # '<">' detected, will build a string literal until
      # an unescaped '<">' is encountered.
      strBuilder.isOn = true
      strBuilder.str.add(tokenStr)

    elif isSep: continue # Ignore whitespace.

    else:
      token = matchToken(tokenStr)
      if token.kind == "":
        raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")
      result.addLast(token)