//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Joshua Gei
// Date: 2/6/2020
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
    	output red,amber,green;     // output port
	input clk;	            // input ports
                    
//Register
	reg red,amber,green;        

//Logic

    always @(posedge clk)
	    	if ((red!=1|amber!=0|green!=0)&(red!=1|amber!=1|green!=0)&(red!=0|amber!=0|green!=1)&(red!=0|amber!=1|green!=0)) 			begin 
  	        	red <= 1;       //if not any of the valid states (this includes don't care states),
  	        	amber <= 0;     //go to 100 
  	        	green <= 0;
	    	end else if (red==1&&amber==0&&green==0) begin
	        	red <= 1;
	        	amber <= 1;
	        	green <= 0;
        	end else if (red==1&&amber==1&&green==0) begin
	        	red <= 0;
	        	amber <= 0;
	        	green <= 1;
        	end else if (red==0&&amber==0&&green==1) begin
	        	red <= 0;
	        	amber <= 1;
	        	green <= 0;
        	end else if (red==0&&amber==1&&green==0) begin
	        	red <= 1;
	        	amber <= 0;
	        	green <= 0;
        	end
        
   
  //for testing purposes only - but may have to remove (will remove once I find an alternative solution to initializing)
        initial
        red = $urandom_range(1'b0,1'b1);
        initial
        amber = $urandom_range(1'b0,1'b1);
        initial 
        green = $urandom_range(1'b0,1'b1);        
        
endmodule
