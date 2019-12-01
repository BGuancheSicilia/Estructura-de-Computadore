module microc(input wire clk, reset, s_abs, s_inc, s_inm, we3, wez, input wire [2:0] op, output wire z, output wire [5:0] opcode);
//Microcontrolador sin memoria de datos de un solo ciclo

//Instanciar e interconectar pc, memprog, regfile, alu, sum, biestable Z y mux's

wire[9:0] mux_abs_to_pc, sum_to_mux_abs, dir, mux_inc_to_sum, dir_salto;
wire[3:0] ra_1, ra_2, wa_3;
wire[7:0] inm, wd_3, rd_1, rd_2, alu_to_mux;
wire[15:0] instruccion;
wire ZALU;

assign ra_1[3:0] = instruccion[11:8];
assign ra_2[3:0] = instruccion[7:4];
assign wa_3[3:0] = instruccion[3:0];
assign inm[7:0] = instruccion[11:4];
assign opcode[5:0] = instruccion[15:10];
assign dir_salto[9:0] = instruccion[9:0];

registro #(10) pc(clk, reset, mux_abs_to_pc, dir);
memprog memprog(clk, dir, instruccion);
regfile banco_registros(clk, we3, ra_1, ra_2, wa_3, wd_3, rd_1, rd_2);
alu alu(rd_1, rd_2, op, alu_to_mux, ZALU);
ffd ffz(clk, reset, ZALU, wez, z);
mux2 muxAlu(alu_to_mux, inm, s_inm, wd_3);

mux2 #(10) muxInc(dir_salto, 10'b1, s_inc, mux_inc_to_sum);
sum sum(mux_inc_to_sum, dir, sum_to_mux_abs);
mux2 #(10) muxPC(sum_to_mux_abs, dir_salto, s_abs, mux_abs_to_pc);

endmodule
