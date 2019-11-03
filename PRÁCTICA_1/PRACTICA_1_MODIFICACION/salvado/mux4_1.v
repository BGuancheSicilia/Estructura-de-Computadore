// PRACTICA 1 ESTRUCTURAS DE COMPUTADORES.
// OBJETIVO 1: Implementación MUX 4:1

module mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] s);

always @(a or b or c or d or s)                       
  case (s)              
    2'b00: out = a;
    2'b01: out = b;
    2'b10: out = c;
    2'b11: out = d;
    default: out = 'bx; 
                        
  endcase
  
endmodule
