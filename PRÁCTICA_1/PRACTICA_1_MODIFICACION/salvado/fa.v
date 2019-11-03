// PRACTICA 1 ESTRUCTURAS DE COMPUTADORES.
// OBJETIVO 2: Implementación Full-Adder.

module fa(output wire cout, sum, input wire a, b,  cin);

 assign {cout, sum} = a + b + cin; 

endmodule
