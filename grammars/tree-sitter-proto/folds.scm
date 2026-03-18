; Amazingly, the tree-sitter parser doesn't group blocks the way most parsers
; do. Luckily, the syntax is regular enough that we can get away with this:
"{" @fold.start
"}" @fold.end
