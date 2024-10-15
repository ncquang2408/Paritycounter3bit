module ParityGeneratorCircuit_3bit (CLK, EVEN, ODD, PAUSE, RESET, Q, LED_7SEG);
    
    // Declaring Inputs
    input CLK, EVEN, ODD, PAUSE, RESET;
    
    // Declaring Outputs
    output reg [2:0] Q 	= 3'b000;
    output reg [6:0] LED_7SEG = 7'b1111111;
    
    always @(posedge CLK) begin
        if(RESET)                    // If Reset button is turned on, set Q = 0
            Q <= 3'b000; 
        else if(PAUSE)                // If Pause button is turned on, stop at that time
            Q <= Q;
	    else if((~ODD & ~EVEN)||(ODD & EVEN)) // Both Even button & Odd button are on or off, count regularly
            Q <= Q + 1'b1;
	    else if(Q == 3'b111)    // Q counts at max ODD value, turn back 0
            Q <= 3'b000;
        else if(Q == 3'b110)    // Q counts at max EVEN value, turn back 0
            Q <= 3'b000;
        else if (ODD) begin    // Odd counting    
            if(Q[0] == 1'b0)    // If the LSB is 0, enhance 1 value
                Q <= Q + 1'b1;
            else 
                Q <= Q + 3'b010;
        end
        else if (EVEN) begin    // Even counting
            if(Q[0] == 1'b1)    // If the LSB is 1, enhance 1 value
                Q <= Q + 1'b1;
            else 
                Q <= Q + 3'b010;
        end
    end

	// LED 7-segment decoder for common anode display
    always @(*)
    case(Q[2:0])
        3'b000:  LED_7SEG = 7'b1111110; // 0
        3'b001:  LED_7SEG = 7'b0110000; // 1
        3'b010:  LED_7SEG = 7'b1101101; // 2
        3'b011:  LED_7SEG = 7'b1111001; // 3
        3'b100:  LED_7SEG = 7'b0110011; // 4
        3'b101:  LED_7SEG = 7'b1011011; // 5
        3'b110:  LED_7SEG = 7'b1011111; // 6
        3'b111:  LED_7SEG = 7'b1110000; // 7
        default: LED_7SEG = 7'b1111111; // Display blank or error
    endcase			

endmodule
