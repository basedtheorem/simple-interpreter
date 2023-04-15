{.experimental: "strictFuncs".} # functions must be pure
from lexer import nil
from parser import nil
import deques

echo """
----------------------------------------
 159.341 2023 Semester 1 | Assignment 1
 Submitted by Laurens Morales, 21011877
----------------------------------------
"""

var currentTokens = initDeque[lexer.Token]()
while true:
  let line = readLine(stdin)
  if line == "": continue

  try:
    var newTokens = lexer.analyse(line)
    for token in newTokens:
      currentTokens.addLast(token)

    var (node, leftover) = parser.parse(currentTokens)
    currentTokens = leftover


  except ValueError:
    echo getCurrentExceptionMsg() & "\nTry again.\n"