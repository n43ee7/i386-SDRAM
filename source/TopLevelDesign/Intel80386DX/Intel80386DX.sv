module Intel80386DX (
	output CLK2,			// CLK ????
	inout [31:0] D,		// DATA 31-0
	output [31:2] A,		// ADDR 31-2
	output [3:0] BE,		// BE 3-0
	output WR,				// W/~R
	output DC,
	output MIO,				// M/~IO
	output LOCK,
	output ADS,				// ~ADS
	input NA,
	input READY,			// READY
	input BS16,
	input HOLD,
	output HLDA,
	input BUSY,
	input ERROR,
	input PEREQ,
	input INTR,
	input NMI,
	input RESET	  			// RESET
);

endmodule