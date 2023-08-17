// Reference From Memory Datasheet pg8

module MT48LC8M8A2 (
	input CKE,
	input CLK,
	
	input CS,
	input WE,
	input CAS,
	input RAS,
	
	input DQM,
	
	input [1:0] BA,
	input [11:0] A,
	
	inout [7:0] DQ
);

endmodule