//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name: Joshua Gei
// Date: 1/6/2020
//
//  Description: In this exercise, you need to design an up / down counter, where: 
//  - If the rst=1, the counter should be set to zero. 
//  - If enable=0, the value should stay constant. 
//  - If direction=1, the counter should count up every clock cycle, otherwise it should count down.
//  - Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
	clk		,	// clock input
	rst		,	// reset input
	enable		,	// enable input
	direction	,	// direction control for counter
	counter_out		// output of the counter
	);

// Ports
    	output [7:0] counter_out;	// output port
	input direction,clk,rst,enable;	// input ports
                    
//Register
	reg [7:0] counter_out;

//Logic - put in enable
      	always @(posedge clk)
	if (rst) begin 
  	counter_out <= 8'b0 ; 	//resets counter to zero if rst = 1
	end else if (enable==0) begin 
	counter_out <= counter_out; //if enable=0 keep constant	
	end else if (direction) begin
  	counter_out <= counter_out + 1;	//if direction=1 count up
	end else begin
  	counter_out <= counter_out - 1; //if direction=0 count down
	end
endmodule

//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Joshua Gei
// Date: 1/6/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
parameter CLK_PERIOD = 10;

//Registers and wires 
reg clk;			// Internal TB variables 
reg rst;		
reg direction;		
reg enable;
reg err;            // Design an error term to check accuracy of program
wire [7:0] counter_out;		// Wire to connect to design output


//Instantiate counter module
counter top ( 
.clk (clk),
.rst (rst),
.direction (direction),
.enable (enable),
.counter_out (counter_out));

//Clock generation
initial begin 
clk=0;
forever #(CLK_PERIOD/2) clk=~clk;	//clock flips value every 5ns
end

//User logic: Test in order: 1) direction: up and down, 2) reset, 3)enable

// 1. Initialize testbench variables to 0 at start of simulation
initial begin
       err=0;
       rst=0;
       direction=1;     //begin with an upwards direction
       enable=1;
       
    // 1. Test for direction  
    #CLK_PERIOD
    if (counter_out==8'b0)
    begin
        $display("***TEST FAILED!");    //this is not a rigorous solution. will try to improve my code.
        err=1;
    end 
      
    // 2. Test for reset 
    rst = 1; 
    #CLK_PERIOD
    if (counter_out==8'b0)
    begin
        $display("***TEST FAILED!");    
        err=1;
    end
    
    // 3. Test for enable
    rst = 0;                //no longer resetting
    direction = 1;          //counter should be running again but...
    enable = 0;             //...it is not enabled, so it should remain at 0
    #CLK_PERIOD 
    if (counter_out!=8'b0)
    begin
        $display("***TEST FAILED!");    
        err=1;
    end
end     // NOTE: this end is for the initial beginning at the start of this section

//Finish simulation and check for success.
initial begin
#200                
if (err==0)	//let the above tests run for 2000ns. If no errors after that time, we take the code to be successful.
$display("***TEST PASSED! :) ***");
$finish;

end
 

endmodule 
 
