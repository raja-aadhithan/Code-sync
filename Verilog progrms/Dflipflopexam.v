`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:03:30 03/16/2019 
// Design Name: 
// Module Name:    Dflipflopexam 
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
module Dflipflopexam(
    input D,
    input clk,
    reg output Q
    );
	 always @(negedge clk) 
    begin
      Q <= D; 
    end 
  


endmodule
