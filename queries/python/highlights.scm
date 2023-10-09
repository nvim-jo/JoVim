;; extends 

;; Class Definitions
(class_definition name: (identifier) @classes)
[":" (ellipsis)] @colon

((identifier) @pybuiltin
 (#lua-match? @pybuiltin "^__[a-zA-Z0-9_]*__$"))

 ((class_definition
  (block
    (function_definition
      name: (identifier) @pyconstructor)))
(#any-of? @constructor "__new__" "__init__"))

(none) @pyliteral
[(true) (false)] @pyliteral

[
  "|"
] @pyor

[
  "->"
] @pyarrow
