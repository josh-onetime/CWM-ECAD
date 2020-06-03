//Multiplexer with two 3-bit inputs, one 1-bit select input and one 3-bit output.

`timescale 1ns / 100ps

module mux(  input [2:0] a,                
             input [2:0] b,                 
             input sel, 	      
	     output [2:0] out);             
 
     	     wire out;

	// When sel is 1, b is taken. Else, a is taken.

   assign out = sel?b:a;              
      
endmodule
