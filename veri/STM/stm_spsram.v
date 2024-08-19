//==================================================
// TEST for STIMULUS-1
//==================================================

integer        i      ;
reg [AW-1 : 0] addr   ;
reg [DW-1 : 0] data   ;
reg [DW-1 : 0] data_o ;

initial begin
     
    $display("#######################################################");
    $display("FRANK TEST for STIMULUS-1 here.");
    $display("   ");

    // start simulation
    $display("\n Start simulation ");
    addr = 16'ha000;
    data = 32'hd000_0000;
    `mm_init;

    com_delay(23);
    // write transacs
    for ( i = 1; i <= 100; i=i+4) begin
        `mm_wr(addr+i, data+i);
        $display("Write data = (%h) into address = (%h)", data + i, addr + i);
    end

    com_delay(10);
    // read transacs
    for ( i = 1; i <= 100; i=i+4) begin
        `mm_rd(addr+i, data_o);
        $display("Read from address (%h) data: (%h)", addr + i, data_o);
        compare(data_o, data+i);
    end

    /******************
    * finish here
    ******************/
    com_delay(10);
    com_printPass;
    $finish;
end
