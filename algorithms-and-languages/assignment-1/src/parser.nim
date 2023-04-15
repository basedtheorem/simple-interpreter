from lexer import Token
import deques


type
  Node = ref object of RootObj

  Identifier = ref object of Node
    value: string

  Assign = ref object of Node
    command: string
    id: Identifier
    exp: Node

  Key = ref object of Node
    command: string

  Output = ref object of Node
    command: string
    exp: Node

  Reverse = ref object of Node
    id: Identifier


proc consumeToken(tokens: var Deque[Token],
                expected: string): Token =
  if tokens.peekFirst().kind == expected:
    return tokens.popFirst()
  raise newException(ValueError, "Syntax Error: expected " & $expected &
                                 "but received " & $tokens.peekFirst().kind)




func parseValue(): Node =
  discard




func parseExpression(tokens: var Deque[Token]): Node =
  




func parseStatement(tokens: Deque[Token]): Node =
  var tokens = tokens
  let cmd: string = tokens.popFirst().kind

  case cmd
    of "assign":
      # (append | set) id expression
      let id = consumeToken(tokens, "id").value
      let idNode = Identifier(value: id)
      let exp = parseExpression(tokens)
      result = Assign(command: cmd, id: idNode, exp: exp)
    of "key":
      # (list | exit)
      result = Key(command: cmd)
    of "out":
      # print[ |length|words|wordcound] expression
      let exp = parseExpression(tokens)
      result = Output(command: cmd, exp: exp)
    of "reverse":
      # reverse id
      let id = consumeToken(tokens, "id").value
      result = Reverse(id: Identifier(value: id))
    else:
      raise newException(ValueError,
                         "Syntax Error: invalid command \"" & cmd & "\"")

  discard consumeToken(tokens, "end")




    




func parse*(tokens: Deque[Token]): (Deque[Node], Deque[Token]) =
  var statements = initDeque[Deque[Token]](2)
  var leftover: Deque[Token]
  var nodes: Deque[Node]

  for token in tokens:
    # split input into statements
    leftover.addLast(token)
    if token.kind == "end":
      statements.addLast(leftover)
      leftover.clear()

  while statements.len() != 0:
    let node = statements.popFirst().parseStatement()
    nodes.addLast(node)

  return (nodes, leftover)