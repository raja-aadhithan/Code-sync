`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:21:15 02/23/2019 
// Design Name: 
// Module Name:    decoder 
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
module decoder(
    input i1,
    input i2,
    output o1,
    output o2,
    output o3,
    output o4
    );
  assign o1 = (~i1) & (~i2) ;
  assign o2 = ( i1) & (~i2) ;
  assign o3 = (~i1) & ( i2) ;
  assign o4 = ( i1) & ( i2) ;

endmodule
