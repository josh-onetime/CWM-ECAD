//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Joshua Gei
// Date: 2/6/2020 (edited 3/6/2020)
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green (but actually why can't we just use a 3-bit output as before and have each bit represent one colour on/off.)
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

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
