// Generic 4-1 MUX Module

module MUX (
    input wire [3:0] A,
    input wire [1:0] S,
    output wire OUT
);

assign mux_output = 	(S == 2'b00) ? A[0] :
							(S == 2'b01) ? A[1] :
							(S == 2'b10) ? A[2] :
							A[3];

endmodule