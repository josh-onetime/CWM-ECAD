//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
<<<<<<< HEAD
// Student Name: Joshua Gei
// Date: 3/6/2020 - 4/6/2020
//
// Description: A testbench module to test Ex7 - Times Table
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
	parameter CLK_PERIOD = 10;

//Registers and wires
	reg clk;
	reg [2:0] a;
	reg [2:0] b;
	reg read;
	reg err;

	wire [5:0] result;

//Instantiate module
	multiplier top(
		.clk(clk),
		.a(a),
		.b(b),
		.read(read),
		.result(result)
	);

//Clock generation
	initial begin
	clk = 0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

//Logic. Test results of multiplier with 1) read on, 2) read off.
	initial begin
		err=0;		
		read=1;
		a<=3'd7;
		b<=3'd7;
		#20
		if(result!=6'd49)
      		begin 
          		$display("***read=1 TEST FAILED! result should be 49, not %d",result);
          		err=1;
       		end
		
		a<=3'd3;
		b<=3'd5;
		read=0;		
		#20
		if(result!=6'd49)
      		begin 
          		$display("***read=0 TEST FAILED! result should be 49, not %d",result);
          		err=1;
       		end
	end
		 
//Finish simulation and check for success
	initial begin
	#150
	if (err==0)
		$display("***TEST PASSED! YOUR RESULT IS: %d***", result);
	$finish;
	end
endmodule 

=======
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

>>>>>>> upstream/master
