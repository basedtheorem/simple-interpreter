import re, tokenize

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




func matchToken(token: string): Token =
  if token == "": return (tokenType: "", value: "")

  const TOKENPATTERNS = [ # evaluated at compile time
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
    ("constant", "\\s"),
    ("end", ";"),
    ("plus", "\\+"),
    ("id", "[a-zA-Z]+[a-zA-Z0-9_]*"),
  ]
  for tokenType in TOKENPATTERNS:
    if match(token, re(tokenType[1])):
      return (tokentype[0], token)

proc getTokens(str: string): seq[Token] =
  for token in str.tokenize(): # 'tokenize' returns: [string, isSeparator]
    if matchToken(token[0]).tokenType == "":
      raise newException(ValueError, "Invalid token: \"" & token[0] & "\"")
    else:
      result.add(matchToken(token[0]))
    
proc handleInput() =
  let userIn: string = readLine(stdin)
  var tokens: seq[Token]
  try:
    tokens = getTokens(userIn)
    if tokens.len == 0: return # ignore empty imput
  except ValueError:
    echo getCurrentExceptionMsg()
    echo "Try again."
    return
  echo tokens

while true:
  handleInput()