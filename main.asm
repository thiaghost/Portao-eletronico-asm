RESET: 
  LDI    R16, LOW(RAMEND) 
  OUT    SPL, R16 
 
  LDI    R16, HIGH(RAMEND) 
  OUT    SPH, R16 
 
INIT: 
  SBI    DDRD, 2 
  SBI    DDRB, 1 
 
  CBI    DDRB, 3 
  CBI    DDRD, 5 
  CBI    DDRD, 6 
  CBI    DDRC, 5 
 
  SBI    PORTB, 3 
  SBI    PORTD, 5 
  SBI    PORTD, 6 
  SBI    PORTC, 5 
 
MAIN: 
 
FECHADO: 
   CBI    PORTB, 1 
   SBIC   PINC, 5 
   RJMP   FECHADO 
 
ABRINDO: 
   SBI    PORTD, 2 
   CBI    PORTB, 1 
   SBIC   PIND, 5 
   RJMP   ABRINDO  
   RJMP   ABERTO 
 
ABERTO: 
   CBI    PORTD, 2 
   LDI    R16, LOW(3000000) 
   LDI    R17, HIGH(3000000) 
   LDI    R18, BYTE3(3000000) 
    
   RCALL   DELAY 
 
FECHANDO: 
  SBI    PORTB, 1 
  SBIS    PINB, 3 
  RJMP    FECHADO 
  SBIC    PIND, 6 
  RJMP    FECHANDO 
  RJMP    ABRINDO 
 
  RJMP    MAIN 

DELAY: 
   
  SUBI    R16, 1 
  SBCI    R17, 0 
  SBCI    R18, 0 
 
  CLR    R0       
  CP    R16, R0     
  CPC    R17, R0     
  CPC    R18, R0     
 
  BREQ    FIM_DELAY 
 
  NOP 
  NOP 
  NOP 
  NOP 
  NOP 
  NOP 
  RJMP    DELAY 
 
FIM_DELAY: 
  RET 