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
