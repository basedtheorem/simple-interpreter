#[
  Original code obtained from the standard library; strutils/tokenize:
    https://github.com/nim-lang/Nim/blob/version-1-6/lib/pure/strutils.nim#L2843

  Modified such that "..." always counts as one token
  even if there are whitespaces inside the double quotes.
  
  Also treats semicolons, ";", as one token (as long as
  it is not inside double quotes).
  
  '##' indicates that the line is modified by me.
]#
const Whitespace* = {' ', '\t', '\v', '\r', '\l', '\f'}

iterator tokenize*(s: string, seps: set[char] = Whitespace): tuple[
  token: string, isSep: bool] =

  var i = 0
  while true:
    var j = i
    var isSep = j < s.len and s[j] in seps
    var isStr = j < s.len and s[j] == '"'                   ## L.M.

    if isStr:                                               ##
      while j < s.len:                                      ##
        if not (j == 0 or i == j or (s[j-1] == '\\')) and   ## respects '\' escapes
            s[j] == '"':                                    ##
          inc(j)                                            ##
          break                                             ##
        inc(j)                                              ##

    elif  j < s.len and s[j] == ';': inc(j)                 ##
    
    else:                                                   ##
      while j < s.len and (s[j] in seps) == isSep and       ##
          s[j] != ';':                                      ##
        inc(j)                                              ##
    
    if j > i:
      yield (substr(s, i, j-1), isSep)
    else:
      break
    i = j