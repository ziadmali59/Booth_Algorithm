`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2023 03:28:05 PM
// Design Name: 
// Module Name: Counter
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


module Counter
    (
        input dcr,clk,ldcnt,
        output reg [4:0] Data_out
    );

    always @(posedge clk ) 
    begin
        if (ldcnt) 
        begin
            Data_out<=5'b10000;    
        end
        else if (dcr) 
        begin
            Data_out<=Data_out-1;    
        end    
    end
endmodule
