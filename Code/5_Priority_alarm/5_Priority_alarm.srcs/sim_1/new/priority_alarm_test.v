`timescale  1ns / 1ps

module tb_priority_alarm;

// priority_alarm Parameters
parameter PERIOD  = 10;


// priority_alarm Inputs
reg   in_I0                                = 0 ;
reg   in_I1                                = 0 ;
reg   in_I2                                = 0 ;
reg   in_I3                                = 0 ;

// priority_alarm Outputs
wire  out_Y0                               ;
wire  out_Y1                               ;
wire  out_Y2                               ;

priority_alarm  u_priority_alarm (
    .in_I0                   ( in_I0    ),
    .in_I1                   ( in_I1    ),
    .in_I2                   ( in_I2    ),
    .in_I3                   ( in_I3    ),

    .out_Y0                  ( out_Y0   ),
    .out_Y1                  ( out_Y1   ),
    .out_Y2                  ( out_Y2   )
);

initial
begin
    {in_I0,in_I1,in_I2,in_I3}=4'b0000;

    #5 {in_I0,in_I1,in_I2,in_I3}=4'b0001;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b0011;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b0101;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b0111;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b1001;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b1011;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b1101;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b1111;

    #5 {in_I0,in_I1,in_I2,in_I3}=4'b0010;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b0110;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b1010;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b1110;

    #5 {in_I0,in_I1,in_I2,in_I3}=4'b0100;
    #5 {in_I0,in_I1,in_I2,in_I3}=4'b1100;

    #5 {in_I0,in_I1,in_I2,in_I3}=4'b1000;

    #5 {in_I0,in_I1,in_I2,in_I3}=4'b0000;
    #10 $finish;

end

endmodule