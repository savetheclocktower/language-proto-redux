
((message (message_name) @name) @definition.message
  ; Match the icon we use for structs.
  (#set! symbol.icon "book")
  (#set! symbol.contextNode "parent.parent.parent.firstNamedChild"))

((rpc (rpc_name) @name) @definition.function
  (#set! symbol.contextNode "parent.parent.firstNamedChild"))

(enum (enum_name) @name
  (#set! symbol.contextNode "parent.parent.parent.firstNamedChild")) @definition.enum

((service (service_name) @name) @definition.service
  (#set! symbol.icon "puzzle"))
