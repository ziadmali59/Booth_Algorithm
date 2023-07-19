`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2023 05:01:42 PM
// Design Name: 
// Module Name: Controller
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


module Controller
    (
        input start,q0,qm,clk,eqz,
        output reg lA,rstA,shfA,lQ,rstQ,shfQ,rstFF,lM,AddSub,dcr,ldcnt,Done
    );
    reg [2:0] state_reg,state_next;
    localparam s0 =0 ;
    localparam s1 =1 ;
    localparam s2 =2 ;
    localparam s3 =3 ;
    localparam s4 =4 ;
    localparam s5 =5 ;
    localparam s6 =6 ;

    always @(posedge clk ) 
    begin
        if (~start) 
        begin
            state_reg<=s0;    
        end
        else 
            state_reg<=state_next;    
    end

    always @(*) 
    begin
        if (start) 
        begin
            
        
        case (state_reg)
            s0:state_next=s1;
            s1:state_next=s2;
            s2:
                begin
                    if ({q0,qm}==2'b01) 
                    begin
                        state_next=s3;    
                    end
                    else if ({q0,qm}==2'b10) 
                    begin
                        state_next=s4;    
                    end
                    else if ({q0,qm}==2'b00||{q0,qm}==2'b11) 
                    begin
                        state_next=s5;    
                    end

                end
            s3:state_next=s5;
            s4:state_next=s5;
            s5:
                begin
                    if ({q0,qm}==2'b01 && !eqz) 
                    begin
                        state_next=s3;    
                    end
                    else if ({q0,qm}==2'b10 && !eqz) 
                    begin
                        state_next=s4;    
                    end
                    else if (eqz) 
                    begin
                        state_next=s6;    
                    end
                end
            s6: state_next=s6;
            default:state_next<=state_reg; 
        endcase  
        end
        else
            state_next<=s0; 
    end

    always @(*) 
    begin
        case (state_reg)
            s0:{lA,rstA,shfA,lQ,    rstQ,shfQ,rstFF,lM,     AddSub,dcr,ldcnt,Done}=12'b0000_0000_0000;
            s1:{lA,rstA,shfA,lQ,    rstQ,shfQ,rstFF,lM,     AddSub,dcr,ldcnt,Done}=12'b0100_0011_0010;
            s2:{lA,rstA,shfA,lQ,    rstQ,shfQ,rstFF,lM,     AddSub,dcr,ldcnt,Done}=12'b1001_0000_0000;
            s3:{lA,rstA,shfA,lQ,    rstQ,shfQ,rstFF,lM,     AddSub,dcr,ldcnt,Done}=12'b1000_0000_1000;
            s4:{lA,rstA,shfA,lQ,    rstQ,shfQ,rstFF,lM,     AddSub,dcr,ldcnt,Done}=12'b1000_0000_0000;
            s5:{lA,rstA,shfA,lQ,    rstQ,shfQ,rstFF,lM,     AddSub,dcr,ldcnt,Done}=12'b0010_0100_0100;
            s6:{lA,rstA,shfA,lQ,    rstQ,shfQ,rstFF,lM,     AddSub,dcr,ldcnt,Done}=12'b0000_0000_0001;
            default: {lA,rstA,shfA,lQ,rstQ,shfQ,rstFF,lM,AddSub,dcr,ldcnt,Done}=12'b0000_0000_0000;
        endcase    
    end

endmodule
