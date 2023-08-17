// Generic Count down timer module 

module WAIT_ST_COUNTER (
		input CLK,			// Clock INPUT
		input LOAD,			// ~RESET state to Load Value
		input [15:0] X,		// Input Load Value 
		output ZERO		// Zero Counter 
);


	reg [31:0] countREG; // Internal register to count down X

	always_ff @(posedge CLK or negedge LOAD) begin
		if (!LOAD) // Reset the counter to load value
			countREG <= X;
		else if (countREG > 0)
			countREG <= countREG - 1;
	end

	assign ZERO = (countREG == 0); // Assign 1 iff 0
	// Be mindful of the indexing
endmodule