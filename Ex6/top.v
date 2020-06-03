`timescale 1ns / 100ps

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
