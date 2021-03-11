`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:52:34 02/16/2019 
// Design Name: 
// Module Name:    allgates 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module allgates(
    input a1,
    input b1,
    input a2,
    input b2,
    input a3,
    input b3,
    input a4,
    input b4,
    input a5,
    input b5,
    input a6,
    input b6,
    input a7,
    output y1,
    output y2,
    output y3,
    output y4,
    output y5,
    output y6,
    output y7
    );
    assign y1 = a1 | b1 ;
	 assign y2 = a2 & b2 ;
	 assign y3 = a3 ^ b3 ;
	 assign y4 = ~ ( a4 | b4 ) ;
	 assign y5 = ~ ( a5 & b5 ) ;
	 assign y6 = ~ ( a4 ^ b4 ) ;
	 assign y7 = ~ a7 ;
	 

endmodule
