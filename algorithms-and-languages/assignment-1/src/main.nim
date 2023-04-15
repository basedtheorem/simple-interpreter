{.experimental: "strictFuncs".} # funcs must be pure
from lexer import nil     # nil forces dot operator instead of
from parser import nil    # importing to global scope
from interpreter import nil
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
    # - Lexer - #
    var newTokens = lexer.analyse(line)

    for token in newTokens:
      currentTokens.addLast(token)

    # - Parser - #
    var (node, leftover) = parser.parse(currentTokens)
    currentTokens = leftover

    # - Interpreter - #
    interpreter.interpret(node)

  except ValueError:
    echo getCurrentExceptionMsg() & "\nTry again.\n"