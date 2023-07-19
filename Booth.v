`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2023 05:01:42 PM
// Design Name: 
// Module Name: Booth
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


module Booth
    (
        input [15:0] Data_in,
        input clk,rst,start,
        output [15:0] Data_out
    );
wire lA,rstA,shfA,lQ,rstQ,shfQ,rstFF,lM,AddSub,dcr,ldcnt,Done;
wire [15:0] dataM,dataA,dataALU,dataQ;
wire [4:0] dataCounter;
wire qm,eqz;
    Register M
    (.Data_in(Data_in),.load(lM),.clk(clk),.rst(rst),.Data_out(dataM));
    shlReg A
    (.Data_in(dataALU),.load(lA),.rst(rstA),.clk(clk),.shf(shfA),.sh_Amount(dataALU[15]),.Data_out(dataA));
    shlReg Q
    (.Data_in(Data_in),.load(lQ),.rst(rstQ),.clk(clk),.shf(shfQ),.sh_Amount(dataALU[0]),.Data_out(dataQ));
    FF_Q FF
    (.D(dataQ[0]),.clk(clk),.rst(rstFF),.Q(qm));
    ALU A1
    (.A(dataA),.B(dataM),.AddSub(AddSub),.Result(dataALU));
    Counter C
    (.dcr(dcr),.clk(clk),.ldcnt(ldcnt),.Data_out(dataCounter));
    assign eqz =~|dataCounter;
    Controller FSM1
    (.start(start),.q0(dataQ[0]),.qm(qm),.clk(clk),.eqz(eqz),.lA(lA),.rstA(rstA),.shfA(shfA),.lQ(lQ),.rstQ(rstQ),.shfQ(shfQ),.rstFF(rstFF),.lM(lM),.AddSub(AddSub),.dcr(dcr),.ldcnt(ldcnt),.Done(Done));


endmodule
