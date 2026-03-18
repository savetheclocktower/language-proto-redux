; COMMENTS
; ========

((comment) @comment.line.double-slash.proto
  (#match? @comment.line.double-slash.proto "^//"))

((comment) @punctuation.definition.comment.proto
  (#match? @punctuation.definition.comment.proto "^//")
  (#set! adjust.endAfterFirstMatchOf "^//"))


((comment) @comment.block.proto
  (#match? @comment.block.proto "^/\\*"))

((comment) @punctuation.definition.comment.begin.proto
  (#match? @punctuation.definition.comment.begin.proto "^/\\*")
  (#set! adjust.endAfterFirstMatchOf "^/\\*"))
((comment) @punctuation.definition.comment.end.proto
  (#match? @punctuation.definition.comment.end.proto "\\*/$")
  (#set! adjust.startBeforeFirstMatchOf "\\*/$"))


; STRINGS
; =======

(string "\"") @string.quoted.double.proto
(string "\"" @punctuation.definition.string.begin.proto
  (#is? test.first))
(string "\"" @punctuation.definition.string.end.proto
  (#is? test.last))


(syntax
  ["\"proto2\"" "\"proto3\""] @string.quoted.double.constant.proto
)

(syntax "syntax" @variable.assignment.syntax.proto)


; SUPPORT
; =======

; The "google.api.http" in `option (google.api.http) =`.
(option
  (full_ident
    (identifier)) @support.other.custom-option.proto)

; CONSTANTS
; =========

[(true) (false)] @constant.language.boolean.proto

(int_lit) @constant.numeric.integer.proto
(float_lit) @constant.numeric.decimal.float.proto

; Work around a bug: `-inf` properly interprets `inf` as an infinity constant,
; but a bare `inf` interprets `inf` as an identifier.
(constant (full_ident (identifier) @constant.numeric.infinity.proto)
  (#eq? @constant.numeric.infinity.proto "inf")
  (#set! capture.final))
(constant (full_ident (identifier) @constant.numeric.nan.proto)
  (#eq? @constant.numeric.infinity.proto "nan")
  (#set! capture.final))

; TYPES
; =====

((type
  [
    "bool"
    "bytes"
    "double"
    "fixed32"
    "fixed64"
    "float"
    "int32"
    "int64"
    "map"
    "sfixed32"
    "sfixed64"
    "sint32"
    "sint64"
    "string"
    "uint32"
    "uint64"
  ]
) @support.storage.type.builtin.proto
  (#set! capture.final))

((key_type
  [
    "bool"
    "bytes"
    "double"
    "fixed32"
    "fixed64"
    "float"
    "int32"
    "int64"
    "map"
    "sfixed32"
    "sfixed64"
    "sint32"
    "sint64"
    "string"
    "uint32"
    "uint64"
  ]
) @support.storage.type.builtin._TYPE_.proto
  (#set! capture.final))

(map_field "map" @support.storage.type.builtin.map.proto)

(message_or_enum_type
  (identifier) @support.storage.other.type.proto
  (#is? test.last))

(message_or_enum_type
  (identifier) @support.storage.other.property.proto
  (#is-not? test.last))

; VARIABLES
; =========

(field (identifier) @variable.declaration.field.proto)
(map_field (identifier) @variable.declaration.field.proto)
(option (identifier) @variable.declaration.option.proto)

(enum_field (identifier) @variable.declaration.enum.proto)

(field_option (identifier) @variable.parameter.field-option.proto)

; ENTITIES
; ========

(message_name (identifier) @entity.name.type.message.proto)
(service_name (identifier) @entity.name.type.service.proto)
(rpc_name (identifier) @entity.name.function.method.proto)
(enum_name (identifier) @entity.name.type.enum.proto)

(block_lit (identifier) @entity.other.attribute-name.proto)

; STORAGE
; =======

[
  "enum"
  "message"
  "option"
  "rpc"
  "service"
] @storage.type._TYPE_.proto

[
  "reserved"
  "repeated"
  "oneof"
] @storage.modifier._TYPE_.proto

; KEYWORDS
; ========

[
  "import"
  "package"
  "returns"
] @keyword.control._TYPE_.proto

; OPERATORS
; =========

"=" @keyword.operator.assignment.proto
"." @keyword.operator.accessor.proto

; PUNCTUATION
; ===========

";" @punctuation.terminator.statement.proto


(map_field
  "<" @punctuation.definition.parameters.begin.bracket.angle.proto
  ">" @punctuation.definition.parameters.end.bracket.angle.proto
)

("[" @punctuation.definition.begin.bracket.square.proto
  (#set! capture.shy))
("]" @punctuation.definition.end.bracket.square.proto
  (#set! capture.shy))

("(" @punctuation.definition.begin.bracket.round.proto
  (#set! capture.shy))
(")" @punctuation.definition.end.bracket.round.proto
  (#set! capture.shy))

("{" @punctuation.definition.begin.bracket.curly.proto
  (#set! capture.shy))
("}" @punctuation.definition.end.bracket.curly.proto
  (#set! capture.shy))
