module router_register(input clock, resetn, pkt_valid, fifo_full, detect_add,
                                        ld_state, laf_state, full_state, lfd_state, rst_int_reg,
                                        input [7:0]data_in,
                                        output reg err, parity_done, low_pkt_valid,
                                        output reg [7:0]dout);

        reg [7:0]header_byte, fifo_full_reg, internal_parity, packet_parity_byte;

        always@(posedge clock or negedge resetn)
        begin
        if(!resetn)
                parity_done <= 1'b0;
        else if(detect_add)
                parity_done <= 1'b0;
        else if(ld_state && !fifo_full && !pkt_valid)
                parity_done <= 1'b1;
        else if(laf_state && low_pkt_valid && !parity_done)
                parity_done <= 1'b1;
        end

        always@(posedge clock)
        begin
        if(!resetn || detect_add)
                low_pkt_valid <= 1'b0;
        else if(rst_int_reg)
                low_pkt_valid <= 1'b0;
        else if(ld_state && !pkt_valid)
                low_pkt_valid <= 1'b1;
        end
       always@(posedge clock)
        begin
                if(!resetn)
                        header_byte <= 0;
                else if(detect_add && pkt_valid && data_in[1:0] != 3)
                        header_byte <= data_in;
        end

        always@(posedge clock)
        begin
                if(!resetn)
                        dout <= 0;
                else if(detect_add && pkt_valid && data_in[1:0] != 3)
                        dout <= dout;
                else if(lfd_state)
                        dout <= header_byte;
                else if(ld_state && !fifo_full)
                        dout <= data_in;
                else if(ld_state && fifo_full)
                        dout <= dout;
                else if(laf_state)
                        dout <= fifo_full_reg;
        end

        always@(posedge clock)
        begin
                if(!resetn)
                        fifo_full_reg <= 0;
                else if(ld_state && fifo_full)
                        fifo_full_reg <= data_in;
        end



        always@(posedge clock)
        begin
                if(!resetn || detect_add)
                        packet_parity_byte <= 0;
                else if(ld_state && !pkt_valid)
                        packet_parity_byte <= data_in;
        end

        always@(posedge clock)
        begin
                if(!resetn)
                        internal_parity <= 0;
                else if(detect_add && pkt_valid)
                        internal_parity <= (internal_parity ^ header_byte);
                else if(pkt_valid && ld_state && !fifo_full)
                        internal_parity <= (internal_parity ^ data_in);
        end

        always@(posedge clock)
        begin
                if(!resetn || detect_add)
                        err <= 0;
                else if (parity_done)
                        begin
                        if(internal_parity != packet_parity_byte)
                                err <= 1'b1;
                        else
                                err <= 0;
                        end
                else
                        err <= 0;
        end

endmodule