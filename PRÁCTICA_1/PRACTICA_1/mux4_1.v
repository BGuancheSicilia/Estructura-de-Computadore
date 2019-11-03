module mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] s);
// mux con construcci�n always (procedural), las asignaciones deben ser a variables con estado ('out' ahora es tipo reg)
// en el caso de un modulo combinacional, se debe usar la asignaci�n procedural 'con bloqueo' que equivale al "=" de C  

always @(a or b or c or d or s) //alternativamente, always @(a, b, s) o always @* (autom�tico, considera todas las var)
                      //no hace falta begin...end porque el always contiene una sola sentencia, el case
  case (s)              
    2'b00: out = a;
    2'b01: out = b;
    2'b10: out = c;
    2'b11: out = d;
    default: out = 'bx; //desconocido en cualquier otro caso (x � z), no se especifica el tama�o en la cte, si 'out' fuera mayor
                        // de un bit, el bit m�s sigificativo si es x � z se extiende hasta completar el tama�o total
  endcase
  
endmodule
