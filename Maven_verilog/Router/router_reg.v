module router_reg(input clock, resetn, pkt_valid, fifo_full, rst_int_reg, detect_add, 
                        ld_state, laf_state, full_state, lfd_state, 
                  output parity_done, low_pkt_valid, err, 
                  input [7:0] data_in, output [7:0] dout);

always(@posedge clock) begin
    if(resetn) begin
        dout <= 8'd0;
        parity_done <= 1'b0;
        low_pkt_valid <= 1'b0;
        err <= 1'b0;
    end
    
    else if(rst_int_reg) low_pkt_valid <= 1'b0;
    else if(detect_add) parity_done <= 1'b0;

    else begin
    parity_done <= (ld_state & !fifo_full & !pkt_valid) | (laf_state & low_pkt_valid & !parity_done);
    low_pkt_valid <= ld_state & !pkt_valid;
    end
end
endmodule