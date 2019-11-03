// PRACTICA 1 ESTRUCTURAS DE COMPUTADORES.
// OBJETIVO 2: Celda Aritmético-lógica.

module cal(output wire out, c_out, input wire a, b, l, c_in, input wire [1:0] s);
	wire cl_salida,fa_salida;
	cl cl1(cl_salida,a,b,s);
  fa fa1(c_out, fa_salida ,a,b,c_in);
  mux2_1 mux11(out,fa_salida,cl_salida,l);
endmodule
