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
    ("constant", "\\s"),
    ("end", ";"),
    ("plus", "\\+"),
    ("id", "[a-zA-Z]+[a-zA-Z0-9_]*"),
  ]
  for tokenType in TOKENPATTERNS:
    if match(token, re(tokenType[1])):
      return (tokentype[0], token)

proc pushTokens(q: Deque[Token], str: string): Deque[Token] =
  result = q
  for token, _ in str.tokenize(): # 'tokenize' returns: [string, isSeparator]
    if matchToken(token).tokenType == "":
      raise newException(ValueError, "Invalid token: \"" & token & "\"")
    else:
      result.addLast(matchToken(token))
    
proc inputHandler() =
  var q = initDeque[Token](10)
  while true:
    let userInput: string = readLine(stdin)
    if userInput == "":
      continue

    try:
      q = pushTokens(q, userInput)
    except ValueError:
      echo getCurrentExceptionMsg()
      echo "Try again."
      continue

    echo q



inputHandler()


#[
  ok

  so the plan is to continuously read input right
  ill need to break them by statements
]#