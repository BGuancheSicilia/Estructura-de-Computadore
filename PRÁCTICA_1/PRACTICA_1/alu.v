// PRACTICA 1 ESTRUCTURAS DE COMPUTADORES.
// OBJETIVO 4: Unidad Aritmético-Lógica.

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire L);

	wire [3:0] Op1, Op2, cpl_in; 	
	wire cout1, cout2, cout3;
	wire Op1_A, Op2_B, cpl, c_in;

	mux2_4 mux_Op1(Op1, 4'b0000, A, Op1_A);
	mux2_4 mux_Op2(cpl_in, A, B, Op2_B);
	compl1 compl_Op2(Op2, cpl_in, cpl);

	cal cal0(R[0], cout1,Op1[0], Op2[0], L, c_in, ALUOp);
	cal cal1(R[1], cout2,Op1[1], Op2[1], L, cout1, ALUOp);
	cal cal2(R[2], cout3,Op1[2], Op2[2], L, cout2, ALUOp);
	cal cal3(R[3], carry,Op1[3], Op2[3], L, cout3, ALUOp);

	assign sign = R[3];
	assign zero = ~(R[0] | R[1] | R[2] | R[3]);
	assign c_in = (ALUOp[0] | ALUOp[1]);
	assign cpl =((~L & ALUOp[0]) | (~L & ALUOp[1]));
	assign Op1_A = (~ALUOp[1] | L);
	assign Op2_B = (~ALUOp[1] | (ALUOp[0]) | (L));

endmodule
