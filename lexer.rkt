#lang br

(require brag/support)

(provide basic-lexer)

; abreviation for [0-9] regex

(define-lex-abbrev digits (:+ (char-set "0123456789")))

; some reserved words

(define-lex-abbrev reserved-words (:or "while" "{" "}"
                                       "+" ":" ";" "="
                                       "-" "*" "/" "%"
                                       "(" ")" "print"
                                       "if" "then"
                                       "else" "<" 
                                       "&&" "||" "!"))

; identifier lexical structure

(define-lex-abbrev ident
  (:seq alphabetic (:* (:or alphabetic numeric))))

; lexer structure
; we mark whitespace as skipable in order to not
; consider such tokens in our parser


(define basic-lexer
  (lexer-srcloc
   [whitespace                   (token lexeme #:skip? #t)] 
   [(from/stop-before "--" "\n") (token 'COMMENT lexeme)]
   [reserved-words               (token lexeme lexeme)]
   [ident                        (token 'ID lexeme)]
   [digits                       (token 'INTEGER (string->number lexeme))]))

