`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/22 23:35:14
// Design Name: 
// Module Name: priority_alarm
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


module priority_alarm(
    input in_I0, 
    input in_I1, 
    input in_I2, 
    input in_I3,
    output out_Y0, 
    output out_Y1, 
    output out_Y2 
    );
reg out_Y0_reg,out_Y1_reg,out_Y2_reg,out_Y3_reg; 
    
always@ * 
    begin 
    case({in_I0,in_I1,in_I2,in_I3}) 
    4'b0000:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b000; 
    // I3报警
    4'b0001:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b111; 
    4'b0011:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b111; 
    4'b0101:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b111; 
    4'b0111:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b111;
    4'b1001:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b111;
    4'b1011:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b111;
    4'b1101:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b111;
    4'b1111:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b111;
    // I2报警
    4'b0010:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b110; 
    4'b0110:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b110; 
    4'b1010:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b110; 
    4'b1110:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b110; 
    // I1报警
    4'b0100:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b101; 
    4'b1100:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b101; 
    // I0报警
    4'b1000:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b100; 

    default:{out_Y0_reg,out_Y1_reg,out_Y2_reg} = 3'b000; 
    endcase 
    end 

assign out_Y0 = out_Y0_reg; 
assign out_Y1 = out_Y1_reg; 
assign out_Y2 = out_Y2_reg; 

endmodule
