// PRACTICA 1 ESTRUCTURAS DE COMPUTADORES.
// OBJETIVO 3: IMplementación complementador a 1 (si/no).

module compl1(output wire [3:0] Sal, input wire [3:0] Ent, input wire cpl);

	assign Sal = cpl ? ~Ent : Ent;

endmodule

