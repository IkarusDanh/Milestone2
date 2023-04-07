/* verilator lint_off UNUSED */
module ins_mem (
    input  logic clk_i, rst_ni,
    input  logic [31:0] addr_i,
    output logic [31:0] instr_o
);
/* verilator lint_off UNUSED */
    reg [31:0] imem [0: 2**12-1] ;

    initial begin
        for (integer i = 0; i < 2**12; i++) begin
            imem[i] = 32'h0000_0000;
        end
        $readmemh("imemory.hex", imem);
    end

    assign instr_o = imem[addr_i>>2];
endmodule : ins_mem
