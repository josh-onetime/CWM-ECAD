//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name: Joshua Gei
// Date: 2/6/2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  DISCLAIMER: This isn't a random dice. This is more like a counter. But can see why it's effectively still a dice
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module dice(
	clk	,	// clock input
	rst	,	// reset input
	button	,	// button input
	throw   ,	// 3-bit output of the throw
	);

// Ports
    	output [2:0] throw;     // output port
	input clk, rst, button;	// input ports
                    
//Register
	reg [2:0] throw;        // use throw variable for storage

//Logic
    always @(posedge clk)
	    if (rst) begin 
  	        throw <= 3'b0 ; 	//resets throw to zero if rst = 1
	    end else if (button&&throw==3'b000|3'b111|3'b110) begin
  	        throw <= 3'b001;	//if throw = 0, 6, or 7; make throw = 1
	    end else if (button&&throw!=3'b000|3'b111|3'b110) begin
  	        throw <= throw + 1;	//otherwise just count up
	    end else begin
  	    throw <= throw;         	//if button=0 keep throw value the same
	    end
endmodule
