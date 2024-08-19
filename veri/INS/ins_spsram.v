//==================================================
// spsram instance
//==================================================
    spsram u_spsram(
        .i_clk      ( w_i_clk      ),
        .i_csn      ( w_i_csn      ),
        .i_wr       ( w_i_wr       ),
        .i_addr     ( w_i_addr     ),
        .i_data_in  ( w_i_data_in  ),
        .o_data_out ( w_o_data_out )
    );
