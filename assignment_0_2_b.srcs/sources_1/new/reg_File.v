`timescale 1ns / 1ps

module reg_File( input CLK,
                 input RFWE,
                 input [4:0] RFR1, RFR2, RFWA,
                 input [31:0] RFWD,
                 output [31:0] RFRD1, RFRD2 );
    
    reg [31 : 0] rf[0 : 31];
    reg [4:0] read_addr_1;      // Registered address for write-first mode
    reg [4:0] read_addr_2;      // Registered address for write-first mode
    
    always @ (posedge CLK)
    begin
        if (RFWE) begin rf[RFWA] <= RFWD; end
        read_addr_1 <= RFR1;        // Registered address for write-first mode
        read_addr_2 <= RFR2;        // Registered address for write-first mode
    end
    
    assign RFRD1 = rf[read_addr_1];     // Synchronous Read
    assign RFRD2 = rf[read_addr_2];     // Synchronous Read
    
endmodule

