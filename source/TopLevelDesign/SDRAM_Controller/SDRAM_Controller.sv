module SDRAM_Controller(
			// CPU -> 80386DX
			input CLK,
			input RESET,	  			// [~RESET]
			output READY,
			input [24:2] ADDR,  		// 30-bit Address Line from CPU
			inout [31:0] DATA,  		// 32-bit Data Line from CPU
			input [3:0] BE,  			// [~BE] Bank Enable from CPU
			input ADS, 		 			// [~ADS] Address Strobe Signal from CPU
			input MIO,					// [M/~IO]
			input WR, 					// [W/~R]
			input CS, 					// [~CS]
			input LOCK,					// [~LOCK] ??
			
			// SDRAM -> Memory
			output SDRAM_CLK,
			output SDRAM_CLK_EN,
			output [2:0] SDRAM_CMD,	// SDRAM_CMD -> [~WE] [~RAS] [~CAS] 
			output [11:0] SDRAM_A, 
			inout [7:0] SDRAM_DQ,
			output SDRAM_CS,
			output [1:0] SDRAM_BA,
			output SDRAM_DQM
);


endmodule 