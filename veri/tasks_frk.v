/*************************************************************************************
  * FRK COMMON TASKS
  ***********************************************************************************/
    task com_printPass( );
        begin
            $display("###################################################################") ;
            $display("FRANK wants to finish here. BYEBYE"                                 ) ;
            $display("")                                                                    ;
            $display("")                                                                    ;
            $display("PPPPPPPPPPPP         AAA          SSSSSSSSSSSSS     SSSSSSSSSSSSS")   ;
            $display("PP         PP       AA AA        SS                SS")               ;
            $display("PPPPPPPPPPPP       AA   AA       SS                SS")               ;
            $display("PP                AAAAAAAAA       SSSSSSSSSSSS      SSSSSSSSSSSS")    ;
            $display("PP               AA       AA                 SS                SS")   ;
            $display("PP              AA         AA                SS                SS")   ;
            $display("PP             AA           AA   SSSSSSSSSSSSS     SSSSSSSSSSSSS ")   ;
            $display("")                                                                    ;
            $display("")                                                                    ;
            $display("====================================================================");
        end
    endtask

// compare
    task compare ;
        input [31:0] data1;
        input [31:0] data2;
        begin
            if (data1 == data2) begin
                $display("GOOD! (o, o)=(%h, %h)", data1, data2);
            end else begin
                $display("NOT matched! please check again. (o, x)=(%8h, %8h)", data1, data2);
                $finish;
            end
        end
    endtask

// task delay
    task com_delay;
        input time num_clks;
        begin
            repeat(num_clks) @(posedge mclk);
            // #num_clks;
        end
    endtask

// clk gen
    task gen_clk;
        input time clk_time;
        begin
            mclk = 0;
            forever #(clk_time/2) mclk = ~mclk;
        end    
    endtask

// reset gen
    task gen_reset;
        input time rst_init;
        input time rst_stop;
        begin
            mrst = 0;
            com_delay(rst_init); mrst  = 1;
            com_delay(rst_stop); mrst  = 0;
        end
    endtask

// finish gen
    task gen_finish;
        input time finish_time;
        begin
            com_delay(finish_time);
            $display("\n finished by limited time.");            
            $finish;
        end
    endtask

//