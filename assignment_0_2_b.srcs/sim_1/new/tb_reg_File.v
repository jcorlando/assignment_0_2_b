`timescale 1ns / 1ps

module tb_reg_File;

// Parameters
parameter WL = 32, MEM_Depth = 32;
//Inputs
reg CLK;
reg RFWE;
reg [4:0] RFR1;
reg [4:0] RFR2;
reg [4:0] RFWA;
reg [WL - 1 : 0] RFWD;
//Outputs
wire [WL - 1 : 0] RFRD1;
wire [WL - 1 : 0] RFRD2;
// Clock generation 
initial
begin
    CLK <= 0;
    RFWE <= 1;
    RFR1 <= 0;
    RFR2 <= 0;
    RFWA <= 0;
    RFWD <= 0;
    
end
always #50 CLK <= ~CLK;
//Instantiate DUT
reg_File # ( .WL(WL), .MEM_Depth(MEM_Depth) )
            DUT( .CLK(CLK), .RFWE(RFWE), .RFR1(RFR1), 
                .RFR2(RFR2), .RFWA(RFWA), .RFWD(RFWD), 
                    .RFRD1(RFRD1), .RFRD2(RFRD2) );

initial
begin
    @(posedge CLK);
    @(posedge CLK);
    RFR1 <= 0;
    RFR2 <= 0;
    RFWE <= 1;
    RFWA <= 0;
    RFWD <= 32'hffffffff;
    @(posedge CLK);
    RFR1 <= 1;
    RFR2 <= 1;
    RFWE <= 1;
    RFWA <= 1;
    RFWD <= 32'h11111111;
    @(posedge CLK);
    RFR1 <= 2;
    RFR2 <= 2;
    RFWE <= 1;
    RFWA <= 2;
    RFWD <= 32'haaaaaaaa;
    @(posedge CLK);
    RFR1 <= 3;
    RFR2 <= 3;
    RFWE <= 1;
    RFWA <= 3;
    RFWD <= 32'heeeeeeee;
    @(posedge CLK);
    RFR1 <= 4;
    RFR2 <= 4;
    RFWE <= 1;
    RFWA <= 4;
    RFWD <= 32'h99999999;
    @(posedge CLK);
    RFR1 <= 5;
    RFR2 <= 5;
    RFWE <= 1;
    RFWA <= 5;
    RFWD <= 32'h66666666;
    @(posedge CLK);
    RFR1 <= 6;
    RFR2 <= 6;
    RFWE <= 1;
    RFWA <= 6;
    RFWD <= 32'h33333333;
    @(posedge CLK);
    RFR1 <= 7;
    RFR2 <= 7;
    RFWE <= 1;
    RFWA <= 7;
    RFWD <= 32'hbbbbbbbb;
end

endmodule

