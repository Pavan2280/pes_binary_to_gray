`timescale 1ns / 1ps

module pes_binary_to_gray_converter_tb;
    reg clk;
    reg rst;
    reg [3:0] b;
    wire [3:0] g;

    pes_binary_to_gray_converter uut (
        .clk(clk),
        .rst(rst),
        .b(b),
        .g(g)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        b = 4'b0000;

        // Reset the DUT
        rst = 1;
        #10 rst = 0;

        // Dump waveform to a VCD file
        $dumpfile("pes_binary_to_gray_converter_tb.vcd");
        $dumpvars(0, pes_binary_to_gray_converter_tb);

        // Apply your test cases here
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

        // Finish the simulation
        #10 $finish;
    end
endmodule

