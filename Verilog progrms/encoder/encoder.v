`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:40:30 02/23/2019 
// Design Name: 
// Module Name:    encoder 
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
module encoder(
    input i1,
    input i2,
    input i3,
    input i4,
    output o1,
    output o2,
	 output o3
    );
    assign o1 = (i2&(~i1)&(~i3)&(~i4))|  (i4&(~i1)&(~i3)&(~i2));
	 assign o2 = (i3&(~i1)&(~i2)&(~i4))|  (i4&(~i1)&(~i3)&(~i2));
	 assign o3 = (i1&(~i2)&(~i3)&(~i4)) | (i2&(~i1)&(~i3)&(~i4)) | (i3&(~i1)&(~i2)&(~i4)) | (i4&(~i1)&(~i3)&(~i2)) ;
endmodule
