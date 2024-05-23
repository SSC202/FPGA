`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/22 22:22:29
// Design Name: 
// Module Name: decoder
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
    output out_Y0, 
    output out_Y1, 
    output out_Y2, 
    output out_Y3
    );

reg out_Y0_reg,out_Y1_reg,out_Y2_reg,out_Y3_reg;

always@ * 
begin 
    if (EN==0) 
    {out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 4'b0000; 
    else 
        case({in_A1,in_A0}) 
        2'b00:{out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 4'b0001; 
        2'b01:{out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 4'b0010; 
        2'b10:{out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 4'b0100; 
        2'b11:{out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 4'b1000; 
        default:{out_Y3_reg,out_Y2_reg,out_Y1_reg,out_Y0_reg} = 4'b0000; 
        endcase 
end 
assign out_Y0 = out_Y0_reg; 
assign out_Y1 = out_Y1_reg; 
assign out_Y2 = out_Y2_reg; 
assign out_Y3 = out_Y3_reg;
endmodule
