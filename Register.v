`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2023 03:27:10 PM
// Design Name: 
// Module Name: Register
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


module Register
    (
        input [15:0] Data_in,
        input load,clk,rst,
        output [15:0] Data_out
    );
    reg [15:0] Q_next,Q_reg ;

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
    end

    assign Data_out=Q_reg;
endmodule
