#lang brag

i-program : (i-statement)*

i-statement : i-assign | i-if | i-skip | i-while

i-assign : i-id /"=" i-exp /";"

i-block : /"{" (i-statement)* /"}"

i-condition : /"(" i-exp /")" 

i-if : /"if" i-condition i-block /"else" i-block

i-skip : /"skip" /";"

i-while : /"while" /"(" i-exp /")" i-block

i-exp : i-or-exp

i-or-exp : [i-or-exp "||"] i-and-exp

i-and-exp : [i-and-exp "&&"] i-not-exp

i-not-exp : ["!"] i-comp-exp

i-comp-exp : [i-comp-exp ("=" | "<")] i-sum

i-sum : [i-sum ("+" | "-")] i-product

i-product : [i-product ("*" | "/" | "%")] i-neg

i-neg : ["-"] i-expt

i-expt : [i-expt ("^")] i-value

@i-value : i-number | i-id | /"(" i-exp /")"

@i-number : INTEGER

@i-id : ID
