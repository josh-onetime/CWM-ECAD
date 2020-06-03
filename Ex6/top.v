//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name: Joshua Gei
// Date: 3/6/2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

//dice submodule
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


//traffic lights submodule
module traffic_lights(
	clk	,	// clock input
	red	,	// colour outputs
    	amber	,	
	green   ,	
	);
// Ports
    	output red,amber,green; // output port
	input clk;	        // input ports               
//Register
	reg red,amber,green;        
//Logic
	always@(posedge clk) begin
		case({red,amber,green})
			3'b100: begin //Red light only
				red = 1;
				amber = 1;
				green = 0;
			end
			3'b110: begin //Red and amber lights only
				red = 0;
				amber = 0;
				green = 1;
			end
			3'b001: begin //Green light only
				red = 0;
				amber = 1;
				green = 0;
			end
			3'b010: begin //Amber light only
				red = 1;
				amber = 0;
				green = 0;
			end
			default: begin //Any other state, set to red light only
				red = 1;
				amber = 0;
				green = 0;
			end
		endcase
	end
endmodule

//Multiplexer submodule (edited from Ex2 to two 3-bit inputs, one 1-bit select input and one 3-bit output.)
module mux(  input [2:0] a,                
             input [2:0] b,                 
             input sel, 	      
	     output [2:0] out);             
 
     	     wire out;

	// When sel is 1, b is taken. Else, a is taken.
   assign out = sel?b:a;                  
endmodule

//main module

module dice_lights_multiplexer(
	input rst,
	input clk,
	input button,
	input sel,
	output [2:0] result
	);
	
//Wires
	wire [2:0] result;
	wire red;
	wire amber;
	wire green;
	wire [2:0] throw;

//Instantiate multiplex module
    	mux multiplexer(
    		.a (throw [2:0]),
    		.b ({red,amber,green}),
    		.sel (sel),
     		.out (result [2:0])
     		);

//Instantiate dice module
    	dice dies(
		.button (button), 
		.clk (clk), 	
		.rst (rst),
		.throw (throw[2:0]) );

//Instantiate traffic_lights module
	traffic_lights lights(
		.clk (clk),
		.red (red),
		.amber (amber),
		.green (green) );
  
endmodule
