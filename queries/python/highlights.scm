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

;; Normal parameters
(parameters
  (identifier) @parameter)
;; Lambda parameters
(lambda_parameters
  (identifier) @parameter)
(lambda_parameters
  (tuple_pattern
    (identifier) @parameter))
; Default parameters
(keyword_argument
  name: (identifier) @parameter)
; Naming parameters on call-site
(default_parameter
  name: (identifier) @parameter)
(typed_parameter
  (identifier) @parameter)
(typed_default_parameter
  (identifier) @parameter)
; Variadic parameters *args, **kwargs
(parameters
  (list_splat_pattern ; *args
    (identifier) @parameter))
(parameters
  (dictionary_splat_pattern ; **kwargs
    (identifier) @parameter))