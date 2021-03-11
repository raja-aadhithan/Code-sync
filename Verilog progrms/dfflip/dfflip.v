`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:18 03/20/2019 
// Design Name: 
// Module Name:    dfflip 
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
module dfflip(
    input d,
    input clk,
    output reg q
    );

always @ (clk)
	 q = d;

endmodule

