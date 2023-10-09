;; extends 

;; Class Definitions
(class_definition name: (identifier) @classes)
[":" (ellipsis)] @colon

((class_definition
  (block
    (function_definition
      name: (identifier) @pyconstructor)))
 (#any-of? @pybaseconstructor "__new__" "__init__"))

(none) @pyliteral
[(true) (false)] @pyliteral