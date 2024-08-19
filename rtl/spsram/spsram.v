/*********************************************************************
 * SoC/Frank:
 * 
 * - single port sram controller
 *
**********************************************************************/
module spsram #(
    parameter DW = 32,  // data width
    parameter AW = 16   // address width
)
(
    input                i_clk      ,
    input                i_csn      ,  // chip select, 0 for active (selected)
    input                i_wr       ,  // 1 for write, 0 for read
    input       [AW-1:0] i_addr     ,
    input       [DW-1:0] i_data_in  ,
    output reg  [DW-1:0] o_data_out  
);

/* mem, size" DWx(2**AW) */
    reg [DW-1:0] mem [(2**AW)-1:0];

/* assign output */
    // for read
    always @(posedge i_clk) begin
        if( !i_csn & !i_wr ) begin
            o_data_out <= mem[i_addr];
        end else begin
            o_data_out <= 'hz;
        end
    end
    // for write
    always @(posedge i_clk) begin
        if( !i_csn & i_wr ) begin
            mem[i_addr] <= i_data_in;
        end
    end

endmodule
