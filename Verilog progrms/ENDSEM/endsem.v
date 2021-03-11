`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:50:40 03/23/2019 
// Design Name: 
// Module Name:    endsem 
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
module endsem(
    input i3,
    input i2,
    input i1,
    input i0,
    input s1,
    input s0,
    output y,
    input i,
    input s3,
    input s2,
    output y3,
    output y2,
    output y1,
    output y0
    );
assign y = ((~s1) & (~s0) & i0) | ((~s1) & (s0) & i1) | ((s1) & (~s0) & i2) | ((s1) & (s0) & i3) ;
assign y0 = ((~s3) & (~s2) & i);
assign y1 = ((~s3) & (s2) & i);
assign y2 = ((s3) & (~s2) & i);
assign y3 = ((s3) & (s2) & i);
endmodule
