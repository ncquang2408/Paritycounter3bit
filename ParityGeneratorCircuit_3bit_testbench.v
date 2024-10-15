`timescale 1ps/1ps
module ParityGeneratorCircuit_3bit_testbench;
	
	parameter CLK_PERIOD = 2;
	
	reg CLK,ODD,EVEN,PAUSE,RESET;
	wire [2:0] Q;
	wire [6:0] LED_7SEG;
	
	ParityGeneratorCircuit_3bit dut(
	.CLK(CLK),
	.EVEN(EVEN),
	.ODD(ODD),
	.PAUSE(PAUSE),
	.RESET(RESET),
	.Q(Q),
	.LED_7SEG(LED_7SEG)
	);
	
	always #((CLK_PERIOD / 2)) CLK = ~CLK; 
	
	initial begin
	CLK 	= 0;
	EVEN 	= 0;
	ODD 	= 0;
	PAUSE	= 0;
	RESET = 0;
	#1;
	
	//Test case 1: counting 0 -> 7 (When ~ODD & ~EVEN)
	EVEN = 0; ODD = 0 ; PAUSE = 0; RESET = 0;
	#5;
	//When Reset = 1
	EVEN = 0; ODD = 0 ; PAUSE = 0; RESET = 1;
	#2;
	EVEN = 0; ODD = 0 ; PAUSE = 0; RESET = 0;
	#5;
	//When Pause = 1
	EVEN = 0; ODD = 0 ; PAUSE = 1; RESET = 0;
	#2;
	EVEN = 0; ODD = 0 ; PAUSE = 0; RESET = 0;
	#5;
	//When Reset = 1 & Pause = 1
	EVEN = 0; ODD = 0 ; PAUSE = 1; RESET = 1;
	#2;
	EVEN = 0; ODD = 0 ; PAUSE = 0; RESET = 0;
	#20;
	
	//------------------------------------------
	
	
	//Test case 2: counting 1,3,5,7
	EVEN = 0; ODD = 1 ;  PAUSE = 0; RESET = 0;
	#5;
	//When Reset = 1
	EVEN = 0; ODD = 1 ; PAUSE = 0; RESET = 1;
	#2;
	EVEN = 0; ODD = 1 ; PAUSE = 0; RESET = 0;
	#5;
	//When Pause = 1
	EVEN = 0; ODD = 1 ; PAUSE = 1; RESET = 0;
	#2;
	EVEN = 0; ODD = 1 ; PAUSE = 0; RESET = 0;
	#5;
	//When Reset = 1 & Pause = 1
	EVEN = 0; ODD = 1 ; PAUSE = 1; RESET = 1;
	#2;
	EVEN = 0; ODD = 1 ; PAUSE = 0; RESET = 0;
	#20;
	
	//------------------------------------------
	
	
	//Test case 3: counting 0,2,4,6
	EVEN = 1; ODD = 0 ; PAUSE = 0; RESET = 0;
	#10;
	//When Reset = 1
	EVEN = 1; ODD = 0 ; PAUSE = 0; RESET = 1;
	#2;
	EVEN = 1; ODD = 0 ; PAUSE = 0; RESET = 0;
	#5;
	//When Pause = 1
	EVEN = 1; ODD = 0 ; PAUSE = 1; RESET = 0;
	#2;
	EVEN = 1; ODD = 0 ; PAUSE = 0; RESET = 0;
	#5;
	//When Reset = 1 & Pause = 1
	EVEN = 1; ODD = 0 ; PAUSE = 1; RESET = 1;
	#2;
	EVEN = 1; ODD = 0 ; PAUSE = 0; RESET = 0;
	#20;
	
	//---------------------------------------------
	
	
	
	//Test case 4: counting 0 -> 7 (When ODD & EVEN)
	EVEN = 1; ODD = 1 ; PAUSE = 0; RESET = 0;
	#10;
	//When Reset = 1
	EVEN = 1;  ODD = 1 ; PAUSE = 0; RESET = 1;
	#2;
	EVEN = 1; ODD = 1 ; PAUSE = 0; RESET = 0;
	#5;
	//When Pause = 1
	EVEN = 1;  ODD = 1 ; PAUSE = 1; RESET = 0;
	#2;
	EVEN = 1; ODD = 1 ; PAUSE = 0; RESET = 0;
	#5;
	//When Reset = 1 & Pause = 1
	EVEN = 1;  ODD = 1 ; PAUSE = 1; RESET = 1;
	#2;
	EVEN = 1; ODD = 1 ; PAUSE = 0; RESET = 0;
	#20;
	end
	
	always @(posedge CLK) begin
		$monitor("At time [%t], EVEN = %b , ODD = %b , PAUSE = %b , RESET = %b , Q = %b , LED_7SEG; = %b",$time,EVEN,ODD,PAUSE,	RESET,Q,LED_7SEG);
	end 
endmodule 