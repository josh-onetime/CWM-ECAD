//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Joshua Gei
// Date: 2/6/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file :(
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires 
	reg clk;		// Internal TB variables 
	reg err;                // Design an error term to check accuracy of program
	wire red,amber,green;	// Wires to connect to design outputs

//Instantiate dice module
	traffic_lights top ( 
	.clk (clk),
	.red (red),
	.amber (amber),
	.green (green));

//Clock generation
	initial begin 
		clk=0;
	forever #(CLK_PERIOD/2) clk=~clk;	//clock flips value every 5ns
	end

//User logic: Test: i. Valid States Transition; ii. Test that it doesn't go to an invalid state
initial begin
       err=0;
    // i. Test for valid states transition
    #(3*CLK_PERIOD/2) 
    	if (red!=1|amber!=0|green!=0)       //1st state of transition
    		begin
        	$display("***TEST FAILED!",red,amber,green);    
        	err=1;
    	end 
    #CLK_PERIOD
    	if (red!=1|amber!=1|green!=0)      //1st --> 2nd state of transition
    		begin
        	$display("***TEST FAILED!",red,amber,green);    
        	err=1;
    	end 
   #CLK_PERIOD
    	if (red!=0|amber!=0|green!=1)       //2nd --> 3rd state of transition
    		begin
        	$display("***TEST FAILED!",red,amber,green);    
        	err=1;
    	end 
    #CLK_PERIOD
    	if (red!=0|amber!=1|green!=0)       //3rd --> 4th state of transition
    		begin
        	$display("***TEST FAILED!",red,amber,green);    
        	err=1;
    	end 
    #CLK_PERIOD
    	if (red!=1|amber!=0|green!=0)       //4th --> 1st state of transition
    		begin
        	$display("***TEST FAILED!",red,amber,green);    
        	err=1;
    	end 
    
    // ii. Test to confirm it never goes into an invalid state 
    #100
    	if ((red==0&&amber==0&&green==0)||(red==1&&amber==0&&green==1)||(red==1&&amber==1&&green==1)||(red==0&&amber==1&&green==1))
    		begin
        	$display("***TEST FAILED!",red,amber,green);    // Display "test failed" if it goes into any of the invalid sttes
        	err=1;
    	end 
end     

//Finish simulation and check for success.
initial begin
	#200            
	if (err==0)	//let the above tests run for 2000ns. If no errors after that time, we take the code to be successful.
		$display("TEST PASSED :D ",red,amber,green);
		$finish;
end
 
endmodule
