module pes_binary_to_gray_converter(
    input wire clk,
    input wire rst,
    input wire [3:0] b,
    output wire [3:0] g
);

reg [3:0] g_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        g_reg <= 4'b0;
    end else begin
        g_reg[0] <= b[1] ^ b[0];
        g_reg[1] <= b[2] ^ b[1];
        g_reg[2] <= b[3] ^ b[2];
        g_reg[3] <= b[3];
    end
end

assign g = g_reg;

endmodule
