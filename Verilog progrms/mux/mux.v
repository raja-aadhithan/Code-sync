`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:06 03/15/2019 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input s0,
    input s1,
    input i1,
    input i2,
    input i3,
    input i4,
    output y
    );
	  assign y = (((~s0) & (~s1) & i1)| ( (~s0) & s1 & i2)|(s0 & (~s1) & i3)|(s1 & s0 & i4));


endmodule
