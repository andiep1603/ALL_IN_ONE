/*
 * Imagis/ testbench for MEM_gen verilog code
 * - instead of using mem_task in each testbench, it is better to make 
 * mem master mem_mst 
 *
 */

module mem_mst #(
    parameter DW = 32,
    parameter AW = 16
)(
    input               mclk        ,
    output reg          mcsn_host   ,
    output reg          mwr_host    ,
    output reg [AW-1:0] maddr_host  ,
    output reg [DW-1:0] mwdata_host ,
    input      [DW-1:0] mrdata_host 
);

/* local parameters */
    localparam delay          = 1;

    task mem_init;
        begin
            $display("mm_init()!!");
            mcsn_host   = 1'b1 ;
            mwr_host    = 1'b0 ;
            maddr_host  =  'hz ;
            mwdata_host =  'hz ;
        end
    endtask

    task mem_write;
        input [AW-1:0] addr;
        input [DW-1:0] data;
        begin
            $display("mm_write()!!");
            @(posedge mclk);

            mcsn_host     <= #(delay) 1'b0 ;
            mwr_host      <= #(delay) 1'b1 ; // WRITE transaction
            maddr_host    <= #(delay) addr ;
            mwdata_host   <= #(delay) data ;
            
            @(posedge mclk);
            mcsn_host     <= #(delay) 1'b1 ;
        end
    endtask

    task mem_read;
        input  [AW-1:0] addr  ;
        output [DW-1:0] data_o;
        begin
            $display("mm_read()!!");
            @(posedge mclk);

            mcsn_host     <= #(delay) 1'b0;
            mwr_host      <= #(delay) 1'b0; // READ transaction
            maddr_host    <= #(delay) addr;
            
            @(posedge mclk);
            #(delay) data_o = mrdata_host ;
            mcsn_host     <= #(delay) 1'b1 ;
        end
    endtask

endmodule