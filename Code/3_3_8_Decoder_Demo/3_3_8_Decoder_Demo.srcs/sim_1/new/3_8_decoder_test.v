`timescale  1ns / 1ps

module tb_decoder;

// decoder Parameters
parameter PERIOD  = 10;


// decoder Inputs
reg   EN                                   = 0 ;
reg   in_A0                                = 0 ;
reg   in_A1                                = 0 ;
reg   in_A2                                = 0 ;

// decoder Outputs
wire  out_Y0                               ;
wire  out_Y1                               ;
wire  out_Y2                               ;
wire  out_Y3                               ;
wire  out_Y4                               ;
wire  out_Y5                               ;
wire  out_Y6                               ;
wire  out_Y7                               ;

decoder  u_decoder (
    .EN                      ( EN       ),
    .in_A0                   ( in_A0    ),
    .in_A1                   ( in_A1    ),
    .in_A2                   ( in_A2    ),

    .out_Y0                  ( out_Y0   ),
    .out_Y1                  ( out_Y1   ),
    .out_Y2                  ( out_Y2   ),
    .out_Y3                  ( out_Y3   ),
    .out_Y4                  ( out_Y4   ),
    .out_Y5                  ( out_Y5   ),
    .out_Y6                  ( out_Y6   ),
    .out_Y7                  ( out_Y7   )
);

initial
begin
    {EN,in_A2,in_A1,in_A0}=4'b0000;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1000;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1001;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1010;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1011;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1100;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1101;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1110;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1111;
    #5 {EN,in_A2,in_A1,in_A0}=4'b1000;
    #10 $finish;
end

endmodule
