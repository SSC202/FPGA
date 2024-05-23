`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/22 22:33:20
// Design Name: 
// Module Name: decode_test
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


module decode_test(

    );
    reg ENt,A0t,A1t; 
    wire Y0t,Y1t,Y2t,Y3t; 

    decoder UUT( 
    .EN(ENt), 
    .in_A0(A0t), 
    .in_A1(A1t), 
    .out_Y0(Y0t), 
    .out_Y1(Y1t), 
    .out_Y2(Y2t), 
    .out_Y3(Y3t));

initial 
    begin 
        {ENt,A1t,A0t}=3'b000;
        #5 {ENt,A1t,A0t}=3'b001; 
        #5 {ENt,A1t,A0t}=3'b010; 
        #5 {ENt,A1t,A0t}=3'b011; 
        #5 {ENt,A1t,A0t}=3'b100; 
        #5 {ENt,A1t,A0t}=3'b101; 
        #5 {ENt,A1t,A0t}=3'b110; 
        #5 {ENt,A1t,A0t}=3'b111; 
        #5 {ENt,A1t,A0t}=3'b000; 
        #10 $finish; 
    end
endmodule
