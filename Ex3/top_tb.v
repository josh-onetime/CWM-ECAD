//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Joshua Gei
// Date: 1/6/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
parameter CLK_PERIOD = 10;

//Registers and wires 
reg clk;			// Internal TB variables 
reg rst;		
reg direction;		
reg enable;
reg err;            // Design an error term to check accuracy of program
wire [7:0] counter_out;		// Wire to connect to design output


//Instantiate counter module
counter top ( 
.clk (clk),
.rst (rst),
.direction (direction),
.enable (enable),
.counter_out (counter_out));

//Clock generation
initial begin 
clk=0;
forever #(CLK_PERIOD/2) clk=~clk;	//clock flips value every 5ns
end

//User logic: Test in order: 1) direction: up and down, 2) reset, 3)enable

// 1. Initialize testbench variables at start of simulation
initial begin
       err=0;
       rst=0;
       direction=1;     //begin with an upwards direction
       enable=1;        //counter is enabled
       
    // 1. Test for direction  
    #CLK_PERIOD
    if (counter_out==8'b00000000)
    begin
        $display("***TEST FAILED!");    //this is not a rigorous solution. will try to improve my code.
        err=1;
    end 
      
    // 2. Test for reset 
    rst = 1; 
    #CLK_PERIOD
    if (counter_out!=8'b0)
    begin
        $display("***TEST FAILED!");    
        err=1;
    end
    
    // 3. Test for enable
    rst = 0;                //no longer resetting
    direction = 1;          //counter should be running again but...
    enable = 0;             //...it is not enabled, so it should remain at 0
    #CLK_PERIOD 
    if (counter_out!=8'b0)
    begin
        $display("***TEST FAILED!");    
        err=1;
    end
    
    // 4. Rigorously test for direction again. (so the front part could be omitted - left in to show my learning process)
    enable = 1;
    #50
    if (counter_out!=8'b00000101)       //going up by 5 steps
    begin
        $display("***TEST FAILED!");    
        err=1;
    end
    direction = 0;
    #30
    if (counter_out!=8'b00000010)       //went down by 3 steps
    begin
        $display("***TEST FAILED!");    
        err=1;
    end
end     // NOTE: this end is for the initial beginning at the start of this section

//Finish simulation and check for success.
initial begin
#110                
if (err==0)	//let the above tests run for 2000ns. If no errors after that time, we take the code to be successful.
$display("TEST PASSED :D");
$finish;
end
 
endmodule 
