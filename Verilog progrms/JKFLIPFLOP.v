`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:22 03/20/2019 
// Design Name: 
// Module Name:    JKFLIPFLOP 
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
module JKFLIPFLOP(
    input J,
    input K,
    input CLK,
    output reg Q
    );
initial begin
Q=1'b0;
end
always@(posedge,CLK);
begin case ({J,K});
2'b00:Q=Q;
2'b01:Q=0;
2'b10:Q=1;
2'b11:Q=~Q;
end case
end
endmodule
