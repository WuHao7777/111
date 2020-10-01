;
; ex2.asm
;
; Created: 30/09/2020 10:31:05 PM
; Author : 73642
;


; Replace with your application code
.include "m2560def.inc"
.equ size=6
.def counter=r17
.dseg
.org 0x200

ucase_string: .byte size
.cseg
                     ldi zl,low(lcase_string<<1)
					 ldi zh,high(lcase_string<<1+1)
					 ldi yh,high(ucase_string)
					 ldi yl, low(ucase_string)
					 clr counter

main:
      lpm r20,z+
	  subi r20,32
	  st y+,r20
	  inc counter
	  cpi counter,size-1
	  brlt main
	  lpm r20,z
	  st y,r20
end:
    rjmp end

lcase_string: .db "hello",0
