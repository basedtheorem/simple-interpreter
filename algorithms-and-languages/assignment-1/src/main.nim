{.experimental: "strictFuncs".} # Force funcs to be pure.

from lexer import nil           # 'import nil' forces dot
from parser import nil          # operator instead of
from interpreter import nil     # importing to global scope.
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
    # Leftover tokens are queued into next iteration.
    currentTokens = leftover


    # - Interpreter - #
    interpreter.interpret(node)


  except ValueError:
    echo getCurrentExceptionMsg() & "\nTry again.\n"
    # Errors will most likely occur in the lexer or parser,
    # so all tokens must be removed from the queue.
    currentTokens.clear()