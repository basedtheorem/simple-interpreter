{.experimental: "strictFuncs".}
from lexer import Token
import deques


type
  Node* = ref object of RootObj

type
  ValueKind* = enum
    identifier
    constant
    literal
  
  Value* = ref object of Node
    case kind*: ValueKind
    of identifier:
      varName*: string
    of constant:
      value*: string
    of literal:
      str*: string

  Plus* = ref object of Value
    left, right: Value

type
  Assign* = ref object of Node
    command*: string
    id*: Value
    exp*: Value

  Key* = ref object of Node
    command*: string

  Output* = ref object of Node
    command*: string
    exp*: Value
    
  Reverse* = ref object of Node
    id*: Value




func consumeToken(tokens: var Deque[Token],
                expected: string): Token =
  if tokens.peekFirst().kind == expected:
    return tokens.popFirst()
  raise newException(ValueError,
                    "Syntax Error: expected token of type: \"" & $expected &
                    "\"but instead received: \"" & $tokens.peekFirst()
                                                         .kind & "\"")




proc parseValue(token: Token): Value =
  let knd: string = token.kind
  var val: string = token.value
  case knd
    of "constant":
      return Value(kind: constant, value: val)
    of "id":
      return Value(kind: identifier, varName: val)
    of "literal":
      val = token.value[1 .. (len(token.value) - 2)]
      return Value(kind: literal, str: val)
  raise newException(ValueError, "Syntax Error: expected token of type: \"value" &
                                 "\" but instead received: \"" & knd & "\"")




func parseExpression(tokens: var Deque[Token]): Value =
  let left = parseValue(tokens.popFirst())
  if tokens.peekFirst().kind == "plus":
    discard tokens.popFirst()
    return Plus(left: left,
               right: parseExpression(tokens))
  return left




func parseStatement(tokens: Deque[Token]): Node =
  var tokens = tokens # Mutable object
  let token = tokens.popFirst()
  let cmd: string = token.kind

  case cmd
    of "assign":
      # (append | set) id expression
      let id = consumeToken(tokens, "id").value
      let idNode = Value(kind: identifier, varName: id)
      let exp = parseExpression(tokens)
      result = Assign(command: token.value, id: idNode, exp: exp)
    of "key":
      # (list | exit)
      result = Key(command: token.value)
    of "out":
      # print[ |length|words|wordcound] expression
      let exp = parseExpression(tokens)
      result = Output(command: token.value, exp: exp)
    of "reverse":
      # reverse id
      let id = consumeToken(tokens, "id").value
      result = Reverse(id: Value(kind: identifier, varName: id))
    else:
      raise newException(ValueError,
                         "Syntax Error: invalid command: \"" & cmd & "\"")
  # Check for 'end' token last
  discard consumeToken(tokens, "end")




func parse*(tokens: Deque[Token]): (Deque[Node], Deque[Token]) =
  var statements = initDeque[Deque[Token]](2)
  var leftover: Deque[Token]
  var treeNodes: Deque[Node]

  for token in tokens:
    # Split input into statements
    leftover.addLast(token)
    if token.kind == "end":
      statements.addLast(leftover)
      leftover.clear()

  while statements.len > 0:
    let node = statements.popFirst().parseStatement()
    treeNodes.addLast(node)

  return (treeNodes, leftover)