`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:16 03/09/2019 
// Design Name: 
// Module Name:    multiplexar 
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
module multiplexar(
    input i0,
    input i1,
    input i2,
    input i3,
    input s0,
    input s1,
    output y
    );
reg y;
always @ (s1 or s0 or i1 or i2 or i3 or i0)
    begin
      y = (((~s1) & (~s0) & i0)| ( (~s0) & s1 & i1)|(s0 & (~s1) & i2)|(s0 & s1 & i3));
    end
endmodule
