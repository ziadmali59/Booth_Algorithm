`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2023 03:27:10 PM
// Design Name: 
// Module Name: shlReg
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


module shlReg
    (
        input [15:0] Data_in,
        input load,rst,clk,shf,sh_Amount,
        output  [15:0] Data_out
    );
    reg [15:0] Q_next,Q_reg;

    always @(posedge clk) 
    begin
        if (rst) 
        begin
            Q_reg<='b0;    
        end
        else
            Q_reg<=Q_next;
    end
    always @(*) 
    begin
        if (load) 
        begin
            Q_next=Data_in;   
        end
        else if (shf) 
        begin
            Q_next={sh_Amount,Data_in[15:1]};    
        end    
    end
    assign Data_out=Q_reg;
endmodule
