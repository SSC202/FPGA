`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/22 22:46:34
// Design Name: 
// Module Name: 
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


module decoder(
    input EN,
    input in_A0,
    input in_A1,
    input in_A2,
    output out_Y0,
    output out_Y1,
    output out_Y2,
    output out_Y3,
    output out_Y4,
    output out_Y5,
    output out_Y6,
    output out_Y7
    );

reg out_Y0_reg,out_Y1_reg,out_Y2_reg,out_Y3_reg,out_Y4_reg,out_Y5_reg,out_Y6_reg,out_Y7_reg;

always@ * 
    begin 
    if (EN==0) 
    {out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0000_0000; 
    else 
    case({in_A2,in_A1,in_A0}) 
    3'b000:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0000_0001;
    3'b001:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0000_0010;
    3'b010:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0000_0100;
    3'b011:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0000_1000;
    3'b100:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0001_0000;
    3'b101:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0010_0000;
    3'b110:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0100_0000; 
    3'b111:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b1000_0000;
    default:{out_Y7_reg,out_Y6_reg,out_Y5_reg,out_Y4_reg,out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 8'b0000_0000; 
    endcase 
end 
assign out_Y0 = out_Y0_reg; 
assign out_Y1 = out_Y1_reg; 
assign out_Y2 = out_Y2_reg; 
assign out_Y3 = out_Y3_reg;
assign out_Y4 = out_Y4_reg; 
assign out_Y5 = out_Y5_reg; 
assign out_Y6 = out_Y6_reg; 
assign out_Y7 = out_Y7_reg;

endmodule
