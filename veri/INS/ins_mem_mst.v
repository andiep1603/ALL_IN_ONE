//==================================================
// mem_mst instance
//==================================================
    mem_mst #(
        .DW( DW ),
        .AW( AW )
    ) u_mem_mst (
        .mclk        ( w_mclk        ),
        .mcsn_host   ( w_mcsn_host   ),
        .mwr_host    ( w_mwr_host    ),
        .maddr_host  ( w_maddr_host  ),
        .mwdata_host ( w_mwdata_host ),
        .mrdata_host ( w_mrdata_host )
    );
