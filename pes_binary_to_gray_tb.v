// Testbench
`timescale 1ns / 1ps

module pes_binary_to_gray_tb;
    reg [3:0] b;
    wire [3:0] g;

    pes_binary_to_gray uut (.b(b), .g(g));

    // Test stimulus
    initial begin
        // Initialize inputs
        $dumpfile("pes_binary_to_gray_tb.vcd");
        $dumpvars(0, pes_binary_to_gray_tb);

        // Add your test cases here
        b = 4'b0000;
        #10 b = 4'b0001;
        #10 b = 4'b0010;
        #10 b = 4'b0011;
        #10 b = 4'b0100;
        #10 b = 4'b0101;
        #10 b = 4'b0110;
        #10 b = 4'b0111;
        #10 b = 4'b1000;
        #10 b = 4'b1001;
        #10 b = 4'b1010;
        #10 b = 4'b1011;
        #10 b = 4'b1100;
        #10 b = 4'b1101;
        #10 b = 4'b1110;
        #10 b = 4'b1111;
        #10 $finish; // Finish the simulation
    end
endmodule

