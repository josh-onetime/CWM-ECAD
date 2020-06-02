//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Joshua Gei
// Date: 2/6/2020 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file :(
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
parameter CLK_PERIOD = 10;

//Registers and wires 
reg clk;		// Internal TB variables 
reg rst;		
reg button;
reg err;            	// Design an error term to check accuracy of program
wire [2:0] throw;	// Wire to connect to design output


//Instantiate dice module
dice top ( 
.clk (clk),
.rst (rst),
.button (button),
.throw (throw));

//Clock generation
initial begin 
clk=0;
forever #(CLK_PERIOD/2) clk=~clk;	//clock flips value every 5ns
end

//User logic: Test: 1. Normal Counting, 2. Reset, 3. Button 

// 1. Initialize testbench variables at start of simulation
initial begin
       err=0;
       rst=0;
       button=1;        //dice is dicing. 
       
    // 1. Test for normal counting 
    #5
    if (throw!=3'b101)
    begin
        $display("***TEST FAILED!");    
        err=1;
    end 
      
    // 2. Test for reset 
    rst = 1; 
    #CLK_PERIOD
    if (throw!=3'b0)
    begin
        $display("***TEST FAILED!");    
        err=1;
    end
    
    // 3. Test for button
    rst = 0;               //no longer resetting...
    button = 0;            //...but button not on, so throw should remain at 0
    #CLK_PERIOD 
    if (throw!=3'b0)
    begin
        $display("***TEST FAILED!");    
        err=1;
    end
    
end     

//Finish simulation and check for success.
initial begin
#50              
if (err==0)	//let the above tests run for 500ns. If no errors after that time, we take the code to be successful.
$display("TEST PASSED :D");
$finish;
end
 
endmodule 
