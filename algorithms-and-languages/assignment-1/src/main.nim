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
    ("constant", "SPACE|TAB|NEWLINE"),
    ("end", ";"),
    ("plus", "\\+"),
    ("id", "[a-zA-Z][a-zA-Z0-9_]*"),
  ]
  for tokenType in TOKENPATTERNS:
    if match(token, re(tokenType[1])):
      return (tokentype[0], token)




#  Lexical layer  #
# --------------- #

func scanTokens(q: Deque[Token], str: string): Deque[Token] =
  # Copies the queue and appends tokens to it.
  # If invalid token is detected, the current input line
  #   is discarded but the previous queue (lines) is retained.
  result = q
  for token, isSep in str.tokenize():
    if isSep: continue
    if matchToken(token).tokenType == "":
      raise newException(ValueError, "Invalid token: \"" & token & "\"")
    else:
      result.addLast(matchToken(token))

# --------------- #




#  Syntax layer  #
# -------------- #

func parseLine(q: Deque[Token], str: string): Deque[Token] =
  discard

#[
  curr state:
    queue where each elem. is a valid token

  what do i want to do here?
  
  steps:
    1. get token one by one
    2. p

]#


# --------------- #



proc handleInput() =
  var q = initDeque[Token](10)
  while true:
    let userInput: string = readLine(stdin)
    if userInput == "": continue
    try:
      q = scanTokens(q, userInput)
    except ValueError:
      echo getCurrentExceptionMsg() & "\nTry again.\n"
      continue

    parseTokens(q)




handleInput()