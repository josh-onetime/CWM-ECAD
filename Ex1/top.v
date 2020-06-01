//////////////////////////////////////////////////////////////////////////////////
// Exercise #1 
// Student Name:Joshua Gei
// Date: 6/1/2020
//
//  Description: In this exercise, you need to design a logical unit, where the  
//  output acts according to the following truth table:
//
//  a | b | out
// -----------------
//  0 | 0 | func[0]
//  0 | 1 | func [1]
//  1 | 0 | func [2]
//  1 | 1 | func [3]
//
//  inputs:
//           a, b, func[3:0]
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module logicalunit(
    input a,
    input b,
    input [3:0] func,
    output out
    );
    
    wire   out;
	//NOTE: func is a 4-bit input, a and b are 1-bit inputs

      assign out = (a&&b)?func[3]:(a?func[2]:(b?func[1]:func[0]));

endmodule
