//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name: Joshua Gei
// Date: 3/6/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module multiplier(clk,a,b,read,result);

// Ports
	input clk,read;	        // input ports
	input [2:0] a,b;    	// a and b are 3-bit inputs each representing a digit from 0 to 7.
	output [5:0] result; 	// result is a 6-bit output representing a value from 0 to 49.
	
//Wires and registers
	wire [5:0] address;        
	
//Logic.
	assign address[5:0]=(a*8)+b;

	memory_multiplier memory_multiplier_project(
		.clka(clk),    		// input wire clka
		.ena(read),      	// input wire ena
		.addra(address),  	// input wire [5 : 0] addra
		.douta(result)  	// output wire [5 : 0] douta
	);
 
endmodule
