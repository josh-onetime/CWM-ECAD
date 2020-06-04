//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
<<<<<<< HEAD
// Student Name: Joshua Gei
// Date: 3/6/2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file :(
//////////////////////////////////////////////////////////////////////////////////

module top_tb(
	);

//Parameters
	parameter TEST_PERIOD = 200; 	//sets how long test runs for
	parameter CLK_PERIOD = 10; 	//clock period

//Registers and wires
	reg clk;
    	reg rst;
	reg button;
	reg sel;
	reg err;
	wire [2:0] result;
	
//Instantiate device module
	dice_lights_multiplexer top(
	.rst (rst),
	.clk (clk),
	.button (button),
	.sel (sel),
	.result (result[2:0]) );

//Clock generation
	initial begin
        clk = 1'b0;
        forever
        #(CLK_PERIOD/2) clk=~clk;
    	end

//Logic. 
//1.Test dice module (note: sel=0)	
initial begin
	err = 0;
	button = 1;
	sel = 0;				
	rst = 1;
	#10 rst = 0; 		
	
	#10
	if(result != 3'b001) begin 
	err = 1;
	$display("***DICE TEST FAILED",result);
	end
//2.Test traffic_lights module (note: sel=1)
	sel = 1;	
	#20
	if(result != 3'b010) begin 
	err = 1;
	$display("***LIGHTS TEST FAILED",);
	end
	end	

//Finish test, check for success
	initial begin
		#TEST_PERIOD
		if (err==0)
        	$display("***ALL TESTS PASSED! :) ***");
		$finish;
	end
endmodule
=======
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

>>>>>>> upstream/master
