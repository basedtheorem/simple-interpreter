from lexer import Token
import deques


type
  Node = ref object of RootObj


type
  ValueKind = enum
    identifier,
    constant,
    literal
  
  Value = ref object of Node
    case kind: ValueKind
      of identifier:
        varName: string
      of constant:
        value: string
      of literal:
        str: string

  Plus = ref object of Node
    left, right: Value


type
  Assign = ref object of Node
    command: string
    id: Value
    exp: Node

  Key = ref object of Node
    command: string

  Output = ref object of Node
    command: string
    exp: Node
    
  Reverse = ref object of Node
    id: Value




proc consumeToken(tokens: var Deque[Token],
                expected: string): Token =
  if tokens.peekFirst().kind == expected:
    return tokens.popFirst()
  raise newException(ValueError, "Syntax Error: expected " & $expected &
                                 "but received " & $tokens.peekFirst().kind)



proc parseValue(token: Token): Value =
  let knd: string = token.kind
  let val: string = token.value
  case knd
    of "constant":
      return Value(kind: constant, value: val)
    of "id":
      return Value(kind: identifier, varName: val)
    of "literal":
      return Value(kind: literal, str: val)
  raise newException(ValueError, "Syntax Error: expected a value type" &
                                 "but instead received: " & knd)




func parseExpression(tokens: var Deque[Token]): Node =
  let val = parseValue(tokens.popFirst())
  if tokens.peekFirst().kind == "plus":
    discard tokens.popFirst()
    return Plus(left: val,
               right: parseValue(tokens.popFirst()))




func parseStatement(tokens: Deque[Token]): Node =
  var tokens = tokens
  let cmd: string = tokens.popFirst().kind

  case cmd
    of "assign":
      # (append | set) id expression
      let id = consumeToken(tokens, "id").value
      let idNode = Value(kind: identifier, varName: id)
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
      result = Reverse(id: Value(kind: identifier, varName: id))
    else:
      raise newException(ValueError,
                         "Syntax Error: invalid command \"" & cmd & "\"")
  # check for 'end' token last
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