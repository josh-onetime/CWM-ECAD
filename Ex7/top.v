//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
<<<<<<< HEAD
<<<<<<< HEAD
// Student Name: Joshua Gei
// Date: 3/6/2020 - 4/6/2020
//
//  Description: Implement a times table of 0..7x0..7 using a memory.
=======
=======
>>>>>>> upstream/master
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
<<<<<<< HEAD
>>>>>>> upstream/master
=======
>>>>>>> upstream/master
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
<<<<<<< HEAD
<<<<<<< HEAD
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
	assign address[5:0]=(a*8)+b;	// address of the value of (a*b) in mem_init.coe file 				

	mem_xtable memory_timestable(	// module instantiated from IP Core
		.clka(clk),    		// input wire clka
		.ena(read),      	// input wire ena
		.addra(address),  	// input wire [5 : 0] addra
		.douta(result)  	// output wire [5 : 0] douta
	);
 
endmodule

//IT ACTUALLY WORKED I'M NOT EVEN 100% SURE WHY IT WORKED BUT YAY. so we didn't even need to know anything about packaging IP cores yet, and don't need to learn how to manually update the tcl file. maybe would be a good idea to omit those parts of the presentation first, if not it could be very confusing for beginners (like me. although others might grasp this more quickly than I did.)
=======
=======
>>>>>>> upstream/master
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////


<<<<<<< HEAD
>>>>>>> upstream/master
=======
>>>>>>> upstream/master
