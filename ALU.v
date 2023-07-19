`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2023 03:13:39 PM
// Design Name: 
// Module Name: ALU
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


module ALU
    (
        input [15:0] A,B,
        input AddSub,
        output reg [15:0] Result
    );

    always @(*) 
    begin
        case (AddSub)
            0:Result=A-B;
            1:Result=A+B; 
            default:Result=A; 
        endcase    
    end
endmodule
