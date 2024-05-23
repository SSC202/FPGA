`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/23 00:05:51
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    // 时钟信号输入
    input clk,
    input rst,
    // SW7-SW4 被减数输入
    input in_A3,    // SW7
    input in_A2,    // SW6
    input in_A1,    // SW5
    input in_A0,    // SW4
    // SW3-SW0 减数输入
    input in_B3,    // SW3
    input in_B2,    // SW2
    input in_B1,    // SW1
    input in_B0,    // SW0
    // 数码管相关输出
    output[7:0] seg0,       // 段选，高有效
    output[7:0] seg1,       // 段选，高有效
    output[7:0] an          // 位选，高有效
    );

// 时钟控制
reg[18:0] divclk_cnt = 0;   //分频计数器
reg divclk = 0;             //分频后的时钟
parameter maxcnt = 50000;

// 输出寄存器
reg[7:0] an_reg=0;
reg[7:0] seg0_reg=0;
reg[7:0] seg1_reg=0;

// 定义减数和被减数
wire[3:0] in_A;         // 被减数A
wire[3:0] in_B;         // 被减数B
reg[3:0] out_A_B=0;       // 计算结果（绝对值）
reg[3:0] out_A_B_10=0;    // 计算结果（绝对值）（减去10）

reg[2:0] disp_bit=0;    // 要显示的位
reg[5:0] disp_dat=0;    // 要显示的数据

assign in_A = {in_A3,in_A2,in_A1,in_A0};
assign in_B = {in_B3,in_B2,in_B1,in_B0};

// 时钟生成
always@(posedge clk)
begin
    if(divclk_cnt==maxcnt)
    begin
        divclk=~divclk;
        divclk_cnt=0;
    end
    else
    begin
        divclk_cnt=divclk_cnt+1'b1;
    end
end

// 逻辑控制
always@(posedge divclk) 
begin
    // 轮询式显示
    if(disp_bit >= 7)
        disp_bit=0;
    else
        disp_bit=disp_bit+1'b1;
    case(disp_bit)       
        3'b000:
            begin
            end
        3'b001:
            begin
            end
        3'b010:
            begin
            end
        3'b011:     // DK5
            begin
                if(in_A == in_B)
                    begin   
                        an_reg = 8'b0000_1000;
                        disp_dat = 5'b00000;    // DK5 显示0
                    end
                else if(in_A > in_B)
                    begin
                        out_A_B = in_A - in_B;
                        if(out_A_B > 4'd9)
                            begin
                                out_A_B_10 = out_A_B - 4'd10;
                                an_reg = 8'b0000_1000;
                                disp_dat = out_A_B_10;          // DK5显示低位
                            end
                        else
                            begin
                                out_A_B_10 = out_A_B;
                                an_reg = 8'b0000_1000;
                                disp_dat = out_A_B_10;
                            end
                    end
                else
                    begin
                        out_A_B = in_B - in_A;
                        if(out_A_B > 4'd9)
                            begin
                                out_A_B_10 = out_A_B - 4'd10;
                                an_reg = 8'b0000_1000;
                                disp_dat = out_A_B_10;          // DK5显示低位
                            end
                        else
                            begin
                                out_A_B_10 = out_A_B;
                                an_reg = 8'b0000_1000;
                                disp_dat = out_A_B_10;
                            end
                    end
            end
        3'b100:
            begin
            end
        3'b101:
            begin
            end
        3'b110:
            begin
            end   
        3'b111:     // DK1
            begin
                if(in_A == in_B)
                    begin   
                        an_reg = 8'b0000_0000;
                    end
                else if(in_A > in_B)
                    begin
                        out_A_B = in_A - in_B;
                        if(out_A_B > 4'd9)
                            begin
                                an_reg = 8'b1000_0000;
                                disp_dat = 5'b00001;
                            end
                        else
                            begin
                                an_reg = 8'b0000_0000;
                            end
                    end
                else
                    begin
                        out_A_B = in_B - in_A;
                        if(out_A_B > 4'd9)
                            begin
                                an_reg = 8'b1000_0000;
                                disp_dat = 5'b10000;    // 显示1和负号
                            end
                        else
                            begin
                                an_reg = 8'b1000_0000;
                                disp_dat = 5'b10001;    // 显示负号
                            end
                    end
            end            
    endcase 
end

always@(disp_dat)
begin
    if(an_reg > 8'b00001000) 
        begin
            case (disp_dat)
            5'b00001 : seg0_reg = 8'h60;
            5'b10001 : seg0_reg = 8'h2;    
            5'b10000 : seg0_reg = 8'h62;   
            endcase
        end
    else 
        begin
            case (disp_dat)
            5'b00000 : seg1_reg = 8'hfc;
            5'b00001 : seg1_reg = 8'h60;
            5'b00010 : seg1_reg = 8'hda;
            5'b00011 : seg1_reg = 8'hf2;
            5'b00100 : seg1_reg = 8'h66;
            5'b00101 : seg1_reg = 8'hb6;
            5'b00110 : seg1_reg = 8'hbe;
            5'b00111 : seg1_reg = 8'he0;
            5'b01000 : seg1_reg = 8'hfe;
            5'b01001 : seg1_reg = 8'hf6;
            endcase
        end
end

assign seg0 = seg0_reg;
assign seg1 = seg1_reg;
assign an = an_reg;

endmodule

