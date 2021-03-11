`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:41:58 03/16/2019 
// Design Name: 
// Module Name:    jkff 
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
module jkff(j, k, clk, q);
  input j, k ; 
  input clk; 
  output reg q; 
  
  always @(negedgeclk) 
    begin
	   q=1'b0;
      case ({j, k})
       
        2'b00:
        
          q <= q ;
        
        
        2'b01:
        
          q <= 0 ;
        
        
        
        2'b10:
        begin
          q <= 1 ;
        end
        
        
        2'b11:
        begin
          q <= ~q ;
        end
      endcase
    end 
  
endmodule 


