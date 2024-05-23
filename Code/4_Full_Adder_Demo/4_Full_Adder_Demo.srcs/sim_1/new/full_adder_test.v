`timescale  1ns / 1ps

module tb_full_adder;

// full_adder Parameters
parameter PERIOD  = 10;


// full_adder Inputs
reg   in_C1                                = 0 ;
reg   in_A                                 = 0 ;
reg   in_B                                 = 0 ;

// full_adder Outputs
wire  out_S                                ;
wire  out_CO                               ;


full_adder  u_full_adder (
    .in_C1                   ( in_C1    ),
    .in_A                    ( in_A     ),
    .in_B                    ( in_B     ),

    .out_S                   ( out_S    ),
    .out_CO                  ( out_CO   )
);

initial
begin
    #5 {in_C1,in_A,in_B}=3'b000;
    #5 {in_C1,in_A,in_B}=3'b001;
    #5 {in_C1,in_A,in_B}=3'b010;
    #5 {in_C1,in_A,in_B}=3'b011;
    #5 {in_C1,in_A,in_B}=3'b100;
    #5 {in_C1,in_A,in_B}=3'b101;
    #5 {in_C1,in_A,in_B}=3'b110;
    #5 {in_C1,in_A,in_B}=3'b111;
    #5 {in_C1,in_A,in_B}=3'b000;
    #10 $finish;
end

endmodule