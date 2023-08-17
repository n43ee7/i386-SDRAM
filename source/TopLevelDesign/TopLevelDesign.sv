module TopLevelDesign(
	input RESET_LG
);

	// Wiring CPU to SDRAM Controller
	wire CLKW;
	wire CLOCK_LOCK;
	wire CLKOUTW;
	wire [31:0] DATA_BUS;
	wire [31:2] ADDR_BUS;
	wire [3:0] BE_BUS;
	wire READY_W;
	wire WR_W;
	wire MIO_W;
	wire ADS_W;
	wire CS_W;
	
	wire RESET_W;
	assign RESET_W = RESET_LG;
	
	// Wiring SDRAM Controller to Memory Device
	wire SDRAM_CLKW;
	wire SDRAM_CKEW;
	wire [3:0] SDRAM_CMDW;
	wire [7:0] SDRAM_DATA_BUS;
	wire [11:0] SDRAM_ADDR_BUS;
	wire [1:0] SDRAM_BA_BUS;
	wire SDRAM_DQM;
	
	// Wiring for Data out Latch Controller

	// Clock Multiplication  PLL/VCO
	PLLVCO2 inst_PLL (
		.CLK	(CLKW),
		.READY	(CLOCK_LOCK),
		.CLKOUT	(CLKOUTW)
	);
	
	
	// Intel 80386DX Block
	Intel80386DX inst_MP (
		.CLK2	(CLKW),			// CLK INPUT????
		.D		(DATA_BUS[31:0]),		// DATA 31-0
		.A		(ADDR_BUS),		// ADDR 31-2
		.BE		(BE_BUS),		// BE 3-0
		.WR		(WR_W),			// W/~R
		.DC		(),
		.MIO	(MIO_W),			// M/~IO
		.LOCK	(),
		.ADS	(ADS_W),			// ~ADS
		.NA		(),
		.READY	(READY_W),		// READY
		.BS16	(),
		.HOLD	(),
		.HLDA	(),
		.BUSY	(),
		.ERROR	(),
		.PEREQ	(),
		.INTR	(),
		.NMI	(),
		.RESET	(RESET_W)	  	// RESET
);

	// DCD Block
	assign CS_W = ~(ADDR_BUS[25] & ADDR_BUS[26] & ADDR_BUS[27] & ADDR_BUS[28] & ADDR_BUS[29] & ADDR_BUS[30] & ADDR_BUS[31]);

	// SDRAM Controller Block 
	SDRAM_Controller inst_SDRAMCont (
		.CLK	(CLKOUTW),
		.RESET	(RESET_W),	  		// [~RESET]
		.READY	(READY_W),			// READY to CPU
		.ADDR	(ADDR_BUS[24:2]),  		// 30-bit Address Line from CPU
		.DATA	(DATA_BUS[31:0]),  		// 32-bit Data Line from CPU
		.BE		(BE_BUS),  			// [~BE] Bank Enable from CPU
		.ADS	(ADS_W), 			// [~ADS] Address Strobe Signal from CPU
		.MIO	(MIO_W),				// [M/~IO]
		.WR		(WR_W), 				// [W/~R]
		.CS		(CS_W), 				// [~CS] >> FROM DCD BLOCK
		.LOCK	(CLOCK_LOCK),		// [~LOCK] 
			
			
		// SDRAM -> Memory
		.SDRAM_CLK		(SDRAM_CLKW),	// To memory
		.SDRAM_CLK_EN	(SDRAM_CKEW),	// to memory
		.SDRAM_CMD		(SDRAM_CMDW[2:0]),	// SDRAM_CMD -> [~WE] [~RAS] [~CAS] 
		.SDRAM_A		(SDRAM_ADDR_BUS), 	
		.SDRAM_DQ		(SDRAM_DATA_BUS[7:0]),
		.SDRAM_CS		(SDRAM_CMDW[3]),
		.SDRAM_BA		(SDRAM_BA_BUS),
		.SDRAM_DQM		(SDRAM_DQM)
	);

	// SDRAM Memory Block
	MT48LC8M8A2 inst_MemoryDevice (
		.CKE	(SDRAM_CKEW),
		.CLK	(SDRAM_CLKW),
		.CS		(SDRAM_CMDW[3]),
		.WE		(SDRAM_CMDW[2]),
		.CAS	(SDRAM_CMDW[0]),
		.RAS	(SDRAM_CMDW[1]),
		.DQM	(SDRAM_DQM),
		.BA		(SDRAM_BA_BUS),
		.A		(SDRAM_ADDR_BUS),
		.DQ		(SDRAM_DATA_BUS[7:0])
);

endmodule