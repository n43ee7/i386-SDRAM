// Latch Design

module S_LATCH (
	input [8:0]IN,		// Data input
	input G,				// Set input (active high)
	input OE,			// Output enable input (active low)
	output [8:0]OUT	// Data Output
);

    always @(IN, G, OE)
    begin
        if (!OE)
        begin
            if (G)
                OUT <= IN; // Set the output to the input value when G is asserted
            // Note: If G is not asserted (G=0), the output retains its previous value.
        end
    end

	
endmodule