`timescale 1ns / 1ps

//==================================================
// alias defined
//==================================================
`define CLK_PERIOD_NS 10.0

//==================================================
// files list
// -IP RTL files here.
//==================================================
`include "list.v"

//==================================================
// defined
//==================================================
`define mm_wr   u_mem_mst.mem_write
`define mm_rd   u_mem_mst.mem_read
`define mm_init u_mem_mst.mem_init

module TB;
//==================================================
// Parameters
//==================================================
    parameter DW = 32;
    parameter AW = 16;

//==================================================
// SIGNALS here
//==================================================
    reg        mclk     ;
    reg        mrst     ;
    integer    clk_cter ;
    
    // mem_mst IOs
    wire               w_mclk        ;
    wire               w_mcsn_host   ;
    wire               w_mwr_host    ;
    wire      [AW-1:0] w_maddr_host  ;
    wire      [DW-1:0] w_mwdata_host ;
    wire      [DW-1:0] w_mrdata_host ;

    // spsram IOs
    wire               w_i_clk      ;
    wire               w_i_csn      ;
    wire               w_i_wr       ;
    wire      [AW-1:0] w_i_addr     ;
    wire      [DW-1:0] w_i_data_in  ;
    wire      [DW-1:0] w_o_data_out ;

    // connect IOs
    assign w_mclk        = mclk         ;
    assign w_mrdata_host = w_o_data_out ;

    assign w_i_clk     = w_mclk        ;
    assign w_i_csn     = w_mcsn_host   ;
    assign w_i_wr      = w_mwr_host    ;
    assign w_i_addr    = w_maddr_host  ;
    assign w_i_data_in = w_mwdata_host ;

//==================================================
// INSTANCE here
//==================================================
    // host instance
    `include "ins_mem_mst.v"

    // spsram instance
    `include "ins_spsram.v"

//==================================================
// dump for debugging
//==================================================
    initial begin
    `ifndef SIM_GTKWAVE         //iverilog + gtkwave
        $dumpfile("TB.vcd");
        $dumpvars(0, TB);
    `endif
    `ifdef SIM_FSDB
        $fsdbDumpfile ("TB.fsdb");
        $fsdbDumpvars(0,TB);
    `endif
    end

//==================================================
// fork tasks
//==================================================
    initial begin
        fork
            gen_clk     ( `CLK_PERIOD_NS );
            gen_reset   ( 100, 40_000    );
            gen_finish  ( 500_000        );
        join
    end

    initial begin
        clk_cter = 0;
    end

    always@(posedge mclk) begin
        clk_cter = clk_cter + 1;  
        $display("clks counter = %d",clk_cter);
    end

    initial begin
        $display("[INFO] main_clock_frequency = %d", 1000.0/`CLK_PERIOD_NS);
    end

//==================================================
// TESTCASE(s) here
// -stm1
//==================================================
`ifndef SIM_STIMULUS_1
    `include "stm_spsram.v"
`endif

//==================================================
// Frank tasks
// -common tasks
// -master tasks
// -slave tasks
//==================================================
    `include "tasks_frk.v"

endmodule
