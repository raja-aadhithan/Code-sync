module router_reg(input clock, resetn, pkt_valid, fifo_full, rst_int_reg, detect_add, 
                        ld_state, laf_state, full_state, lfd_state, 
                  output reg parity_done, low_pkt_valid, err, 
                  input [7:0] data_in, output reg [7:0] dout);
reg [7:0] a,b,c,d;
always@(posedge clock) begin
    if(!resetn) begin
        dout <= 8'd0;
        parity_done <= 1'b0;
        low_pkt_valid <= 1'b0;
        err <= 1'b0;
    end
    else if(rst_int_reg) begin
        c <= 0;
    end
    else begin
    parity_done <= ((ld_state & !fifo_full & !pkt_valid) | (laf_state & low_pkt_valid & !parity_done)) & !detect_add;
    low_pkt_valid <= (ld_state & !pkt_valid);
    if(pkt_valid) begin
    if(detect_add) begin
        a <= data_in;
        c <= data_in;
    end
    if(ld_state) begin
       if(fifo_full) b <= data_in;
       if(!full_state) c <= c^data_in;
    end 
    end
    
    else begin
        d <= data_in;
    end
    end
dout <= resetn ? (lfd_state ? a : (laf_state ? b : (ld_state ? data_in : dout))) : 8'd0;
err <= (c==d) ? 0 : 1 ;
end
endmodule