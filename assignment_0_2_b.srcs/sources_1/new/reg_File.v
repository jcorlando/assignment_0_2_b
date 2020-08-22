`timescale 1ns / 1ps

module reg_File( input CLK,
                 input RFWE,
                 input [4:0] RFR1, RFR2, RFWA,
                 input [31:0] RFWD,
                 output [31:0] RFRD1, RFRD2 );
    
    reg [31:0] rf[31:0];
    
    always @ (posedge CLK) 
        if (RFWE) rf[RFWA] <= RFWD;
    
    assign RFRD1 = (RFR1 != 0) ? rf[RFR1] : 0;
    assign RFRD2 = (RFR2 != 0) ? rf[RFR2] : 0;
    
endmodule

