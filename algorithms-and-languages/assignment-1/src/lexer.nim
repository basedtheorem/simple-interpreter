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
    if strBuilder.isOn:
      if tokenStr[0] == '"':
        strBuilder.str.add('"')
        result.addLast(Token(kind: "literal", value: strBuilder.str))
        strBuilder.isOn = false
        strBuilder.str = ""
        if tokenStr.len > 1:
          token = matchToken(tokenStr[1..tokenStr.len])
          result.addLast(token)
      else:
        strBuilder.str.add(tokenStr)

    elif tokenStr[0] == '"': # 'str[^1]' indexes last char.
      # will build a string literal until
      # an unescaped '<">' is encountered.
      strBuilder.isOn = true
      strBuilder.str.add(tokenStr)

    elif isSep: continue # Ignore whitespace.

    else:
      token = matchToken(tokenStr)
      if token.kind == "":
        raise newException(ValueError, "Invalid token: \"" & tokenStr & "\"")
      result.addLast(token)