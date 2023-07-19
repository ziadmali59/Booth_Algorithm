`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2023 03:13:39 PM
// Design Name: 
// Module Name: FF_Q
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FF_Q
    (
        input D,clk,rst,
        output reg Q
    );

    always @(posedge clk ) 
    begin
        if (rst) 
        begin
            Q<=1'b0;    
        end 
        else
            Q=D;   
    end
endmodule
