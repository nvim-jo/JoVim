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

(function_definition
  parameters: (parameters
    [
      (identifier) @parameter
      (list_splat_pattern
        (identifier) @parameter)
      (dictionary_splat_pattern
        (identifier) @parameter)
      (default_parameter
        (identifier) @parameter)
      (typed_parameter
        [
          (identifier) @parameter
          (list_splat_pattern
            (identifier) @parameter)
          (dictionary_splat_pattern
            (identifier) @parameter)
        ])
      (typed_default_parameter
        (identifier) @parameter)
    ]))
(lambda
  parameters: (lambda_parameters
    [
      (identifier) @parameter
      (list_splat_pattern
        (identifier) @parameter)
      (dictionary_splat_pattern
        (identifier) @parameter)
      (default_parameter
        (identifier) @parameter)
    ]))
(except_clause
  (as_pattern
    (as_pattern_target
      (identifier) @catch)))