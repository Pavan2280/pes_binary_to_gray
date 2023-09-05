//Verilog Code 4-bit Binary to Gray by using Data Flow Modelling
`timescale 1ns / 1ps
module pes_binary_to_gray(
    input [3:0] b,      
    output [3:0] g 
    );
assign g[0]=b[1]^b[0];   
assign g[1]=b[2]^b[1];
assign g[2]=b[3]^b[2];
assign g[3]=b[3];
endmodule
