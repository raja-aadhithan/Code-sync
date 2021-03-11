`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:27:10 03/09/2019 
// Design Name: 
// Module Name:    demux 
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
module demux(
    input i,
    input s1,
    input s0,
    output y3,
    output y2,
    output y1,
    output y0
    );
  assign y0 = ((~s0) & (~s1) & i);
  assign y2 = ((~s0) &   s1  & i);
  assign y1 = (  s0  & (~s1) & i);
  assign y3 = (  s0  &   s1  & i);

endmodule
