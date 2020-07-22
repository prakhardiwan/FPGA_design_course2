module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output [3:0]Q,        // Parallel Output 	
    output RCO            // Ripple Carry Output (Terminal Count)
);
// student code here
reg [3:0]temp;
wire x;
and and1(x, ENT, ENP);
always @(negedge CLR_n or posedge CLK)
	begin
		if (!CLR_n)		
			temp <= 4'b0000;
		else if (!LOAD_n)
			temp <= D;
		else if (LOAD_n)
			if(x==1) 
				temp = temp+1;
	end
	assign Q = temp;
	assign RCO = ENT & (&Q); 
endmodule 
