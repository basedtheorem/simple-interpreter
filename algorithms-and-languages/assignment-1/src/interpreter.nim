{.experimental: "strictFuncs".}
import deques, parser, tables
from strutils import tokenize


var symbolTable: Table[string, string]


proc visitValue(node: Value): string =
  case node.kind
    of identifier: return node.varName
    of constant:
      if node.value == "SPACE": return " "
      if node.value == "TAB": return "\t"
      if node.value == "NEWLINE": return "\n"
    of literal: return node.str




proc evalExpr(node: Node): string =
  if node of Value:
    let valNode = Value(node)
    let val = visitValue(valNode)
    if valNode.kind == identifier:
      return symbolTable[val]
    return val
  let pNode = Plus(node)
  let (left, right) = (pNode.left, pNode.right)
  return visitValue(Value(left)) & evalExpr(right)




proc visitReverse(node: Reverse) =
  let id: string = visitValue(node.id)
  var val:string = symbolTable[id]
  var (a, b) = (0, val.len - 1)
  while a < b:
    (val[a], val[b]) = (val[b], val[a])
    inc(a)
    dec(b)




proc visitOutput(node: Output) =
  let val: string = evalExpr(node.exp)
  case node.command
    of "print":
      echo val
    of "printlength":
      echo "Length is: ", val.len
    of "printwords":
      echo "Words are:\n"
      for word, isSep in tokenize(val): # from stdlib
        if not isSep: echo word
    of "printwordcount":
      var count = 0
      for _ in tokenize(val): inc(count)
      echo "Wordcount is: ", count




proc visitKey(node: Key) =
  if node.command == "list":
    echo "Identifier list (", symbolTable.len, "):"
    for id, val in pairs(symbolTable):
      echo id, ": ", val
  else: # == "end":
    quit(0)




proc visitAssign(node: Assign) =
  let id: string = visitValue(node.id)
  let exp: string = evalExpr(node.exp) 
  if node.command == "set":
    symbolTable[id] = exp
  else: # == "append":
    symbolTable[id].add(exp)




proc visitCmd(node: Node) =
  if node of Assign:
    Assign(node).visitAssign()
  elif node of Key:
    Key(node).visitKey()
  elif node of Output:
    Output(node).visitOutput()
  elif node of Reverse:
    Reverse(node).visitReverse()
    



proc interpret*(treeNodes: var Deque[Node]) =
  while treeNodes.len > 0:
    let treeNode = treeNodes.popFirst() 
    visitCmd(treeNode)