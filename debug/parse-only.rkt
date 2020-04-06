#lang br/quicklang
(require imp/parser imp/tokenizer)

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (strip-bindings
   #`(module imp-parser-mod imp/debug/parse-only
       #,parse-tree)))
(module+ reader (provide read-syntax))

(define-macro (parser-only-mb PARSE-TREE)
  #'(#%module-begin
     'PARSE-TREE))
(provide (rename-out [parser-only-mb #%module-begin]))
