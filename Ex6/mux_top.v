//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name: Joshua Gei
// Date: 1st June 2020
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(  input a,                 // 1-bit input called a
             input b,                 // 1-bit input called b
             input sel, 	      // input sel used to select between a and b
	     output out);             // 1-bit output
 
     	     wire out;

	// When sel is 1, b is taken. Else, a is taken.

   assign out = sel?b:a;              
      
endmodule
