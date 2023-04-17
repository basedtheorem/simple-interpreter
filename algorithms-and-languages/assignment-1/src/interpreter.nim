{.experimental: "strictFuncs".}
import deques, parser, tables, re
from std/strutils import tokenize
from std/sequtils import filter


# Symbol table implemented as a hashmap;
# remembers order of insertion when iterated.
var symbolTable: OrderedTable[string, string]




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
  let id: string = visitValue(node.id)
  var val: string = symbolTable[id]
  var newVal = val
  var i = val.len - 1
  var j: int
  for token, _ in val.tokenize():
    # Strings are mutable and reversed in place
    j = token.len
    for char in token:
      newVal[i - j + 1] = char
      dec(j)
    i = i - token.len
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
      for word in val.split(re"[^'\w]+"):
        # For some reason, the  regexp matches
        # an empty string if there is a full stop.
        if word != "":
          echo word
    of "printwordcount":
      echo "Wordcount: ",
            val.split(re"[^'\w]+")
               .filter(proc(w: string): bool = w != "")
               .len()




proc visitKey(node: Key) =
  if node.command == "list":
    echo "Identifier list (", symbolTable.len, "):"
    for id, val in pairs(symbolTable):
      echo id, ": ", val
  else: # == "exit":
    stdout.write("Are you sure? [y/n]: ")
    stdout.flushFile()
    var input = readLine(stdin)
    while input != "y" and input != "n":
      input = readLine(stdin)
    if input == "y": quit(0)




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