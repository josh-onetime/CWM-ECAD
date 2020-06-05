//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 
// Student Name: Joshua Gei
// Date: 4/6/2020 - 5/6/2020
//
//  Description: In this exercise, you need to design a module that lights leds
//  at different frequencies
//
//  inputs:
//           rst_n, clk_n, clk_p, button
//
//  outputs:
//           led_0, led_1, led_2
//////////////////////////////////////////////////////////////////////////////////


module top(rst_n, clk_n, clk_p, button,led_0, led_1, led_2);

// Ports
	input rst_n, clk_n, clk_p, button;
	output led_0, led_1, led_2; 
    
// Wires and Registers
	reg led_0, led_1, led_2;

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

//Add logic here
	always @(posedge clk)
	if (button==1'b1) begin
		led_0<=1'b0;
		led_1<=1'b0;
		led_2<=1'b0;
		end
	else if (rst_n==1'b0) begin
		led_0<=1'b0;
		led_1<=1'b0;
		led_2<=1'b0;
		end
	
	

endmodule
