// Shift Register clock cycle delay module

module delayed_Clock (
    input wire clk,
    input wire reset,
	 input wire select,
    input wire input_signal,
    output wire output_logic
);

reg [6:0] shift_registerA = 0;	// 0
reg [1:0] shift_registerB = 0;	// 1
wire delayed_signal;

initial begin
	if (!select) begin 
		assign delayed_signal = shift_registerA[6];
	end
	else begin
		assign delayed_signal = shift_registerB[1];
	end
end

always_ff @ (posedge clk or posedge reset) begin
    // 7 Cycles delay
	 if (reset && !select)
        shift_registerA <= 0;
    else
        shift_registerA <= {shift_registerA[5:0], input_signal};
	 
	 // 2 cycles delay
	 if (reset && select)
		shift_resisterB <= 0;
	 else
		shift_registerB <= {shift_registerB[0], input_signal};
end

assign output_logic = delayed_signal;

endmodule