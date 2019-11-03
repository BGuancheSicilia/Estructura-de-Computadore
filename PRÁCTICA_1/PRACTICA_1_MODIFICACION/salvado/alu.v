// PRACTICA 1 ESTRUCTURAS DE COMPUTADORES.
// OBJETIVO 4: Unidad Aritmético-Lógica.

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire L);

	wire [3:0] Op1, Op2, cpl_in; 
	wire [3:0] sal_mux;
	wire cout1, cout2, cout3;
	wire Op1_A, Op2_B, cpl, cin;

	mux2_4 mux_Op1(sal_mux, 4'b0000, A, Op1_A);
	mux2_4 mux_Op2(cpl_in, A, B, Op2_B);
	compl1 compl_Op2(Op2, cpl_in, cpl);
        or or_mod(Op1,sal_mux,1)

	cal cal_0(R[0], cout_0, Op1[0], Op2[0], L, cin, ALUOp);
	cal cal_1(R[1], cout_1, Op1[1], Op2[1], L, cout_0, ALUOp);
	cal cal_2(R[2], cout_2, Op1[2], Op2[2], L, cout_1, ALUOp);
	cal cal_3(R[3], carry, Op1[3], Op2[3], L, cout_2, ALUOp);

	assign sign = R[3];
	assign zero = ~(R[0] | R[1] | R[2] | R[3]);
	assign cin = (ALUOp[0]);
	assign cpl = (ALUOp[0]);
	assign Op1_A = (~ALUOp[1] | ALUop[1] | L);
	assign Op2_B = (~ALUOp[1] | (ALUOp[0]) | L);

endmodule
