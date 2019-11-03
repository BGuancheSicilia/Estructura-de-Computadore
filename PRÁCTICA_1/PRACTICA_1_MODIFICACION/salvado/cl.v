// PRACTICA 1 ESTRUCTURAS DE COMPUTADORES.
// OBJETIVO 2: Implementación celda lógica.

module cl(output wire out, input wire a, b, input wire [1:0] s);
	wire and_salida, xor_salida, or_salida, not_salida;
	and and1(and_salida,a,b);
	not not1(not_salida,a);
	xor xor1(xor_salida,a,b);
	or or1(or_salida,a,b);

	mux4_1 muxy(out,and_salida,or_salida,xor_salida,not_salida, s);

endmodule
