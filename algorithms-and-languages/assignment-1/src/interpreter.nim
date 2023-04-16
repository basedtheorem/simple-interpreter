{.experimental: "strictFuncs".}
import deques, parser, tables, re
from std/strutils import tokenize


# Symbol table implemented as a hashmap
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
    let valNode = Value(node) # Type cast Node to Value.
    let val = visitValue(valNode)
    if valNode.kind == identifier:
      return symbolTable[val]
    return val
  # node of Plus:
  let pNode = Plus(node)
  var  left = visitValue(pNode.left)
  let right = evalExpr(pNode.right)
  if pNode.left.kind == identifier:
    left = symbolTable[left]
  return left & right




proc visitReverse(node: Reverse) =
  # Strings are mutable and reversed in place
  let id: string = visitValue(node.id)
  var val: string = symbolTable[id]
  var newVal: string
  for str, _ in val.tokenize():
    newval.add(str)
  var (left, right) = (0, newval.len)
  while left < right:
    (newVal[left], newVal[right]) = (newVal[right], newVal[left])
    inc(left)
    dec(right)
  symbolTable[id] = newVal




proc visitOutput(node: Output) =
  let val: string = evalExpr(node.exp)
  case node.command
    of "print":
      echo val
    of "printlength":
      echo "Length is: ", val.len
    of "printwords":
      echo "Words:"
      for word in split(val, sep=re"[^'\w]+"):
        echo word
    of "printwordcount":
      var count = 0
      echo "Wordcount is: ", split(val, sep=re"[^'\w]+").len




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