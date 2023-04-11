import re, tables, tokenize

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

let tokenPatterns: OrderedTable[string, Regex] = {
  "literal": re("\"[[:ascii:]]*\""),
  "append": re"append",
  "exit": re"exit",
  "list": re"list",
  "print": re"print",
  "printlength": re"printlength",
  "printwords": re"printwords",
  "printwordcount": re"printwordcount",
  "reverse": re"reverse",
  "set": re"set",
  "constant": re"\s", #
  "end": re";",
  "plus": re"\+",
  "id": re"[a-zA-Z][a-zA-Z0-9_]",
}.toOrderedTable()

proc getTokens(str: string): seq[Token] =
  for token in tokenize(str): # 'tokenize' returns: [typeOfToken, isSeparator]
    for tokenType, regexPattern in tokenPatterns:
      if match(token[0], regexPattern):
        result.add((tokenType, token[0])) # result is declared & 
        break                             # returned implicitly
    

while true:
  let userIn: string = readLine(stdin)
  discard getTokens(userIn)