module router_fsm(input clock, resetn, pkt_valid, parity_done,
                                                fifo_full, soft_reset_0, soft_reset_1, soft_reset_2,
                                                low_pkt_valid, fifo_empty_0, fifo_empty_1, fifo_empty_2,
                                        input [1:0]data_in,
                                        output busy, detect_add, ld_state, laf_state,
                                                full_state, write_enb_reg, rst_int_reg, lfd_state);

        reg [2:0]state, next_state;

        parameter DECODE_ADDRESS = 3'd0,
                        LOAD_FIRST_DATA = 3'd1,
                        LOAD_DATA = 3'd2,
                        LOAD_PARITY = 3'd3,
                        FIFO_FULL_STATE = 3'd4,
                        LOAD_AFTER_FULL = 3'd5,
                        CHECK_PARITY_ERROR = 3'd6,
                        WAIT_TILL_EMPTY = 3'd7;

        always@(posedge clock or negedge resetn)
        begin
        if(!resetn)
                state <= DECODE_ADDRESS;
        else
                state <= next_state;
        end

        always@(*)
        begin
        if(soft_reset_0 || soft_reset_1 || soft_reset_2)
                next_state = DECODE_ADDRESS;
        else
         begin
        case(state)
        DECODE_ADDRESS  :       begin
                                                if((pkt_valid && data_in==2'd0 && fifo_empty_0) || (pkt_valid && data_in==2'd1 && fifo_empty_1) || (pkt_valid && data_in==2'd2 && fifo_empty_2))
                                                        next_state = LOAD_FIRST_DATA;
                                                else if((pkt_valid && data_in==2'd0 && ~fifo_empty_0) || (pkt_valid && data_in==2'd1 && ~fifo_empty_1) || (pkt_valid && data_in==2'd2 && ~fifo_empty_2))
                                                        next_state = WAIT_TILL_EMPTY;
                                                else
                                                        next_state = DECODE_ADDRESS;
                                                end

        LOAD_FIRST_DATA :       begin
                                                next_state = LOAD_DATA;
                                                end

        LOAD_DATA               :       begin
                                                if(fifo_full)
                                                        next_state = FIFO_FULL_STATE;
                                                else if(!fifo_full && !pkt_valid)
                                                        next_state = LOAD_PARITY;
                                                else
                                                        next_state = LOAD_DATA;
                                                end

        FIFO_FULL_STATE :       begin
                                                if(fifo_full)
                                                        next_state = FIFO_FULL_STATE;
                                                else
                                                        next_state = LOAD_AFTER_FULL;
                                                end

        LOAD_AFTER_FULL :       begin
                                                if(!parity_done && low_pkt_valid)
                                                        next_state = LOAD_PARITY;
                                                else if(!parity_done && !low_pkt_valid)
                                                        next_state = LOAD_DATA;
                                                else if(parity_done)
                                                        next_state = DECODE_ADDRESS;
                                                end

        LOAD_PARITY             :       begin
                                                next_state = CHECK_PARITY_ERROR;
                                                end

        CHECK_PARITY_ERROR      :       begin
                                                        if(fifo_full)
                                                                next_state = FIFO_FULL_STATE;
                                                        else
                                                                next_state = DECODE_ADDRESS;
                                                        end

        WAIT_TILL_EMPTY :       begin
                                                if(fifo_empty_0 || fifo_empty_1 || fifo_empty_2)
                                                        next_state = LOAD_FIRST_DATA;
                                                else
                                                        next_state = WAIT_TILL_EMPTY;
                                                end
        default                 :       next_state = DECODE_ADDRESS;
        endcase
        end
        end

assign detect_add       = (state == DECODE_ADDRESS);


assign busy             = (state == WAIT_TILL_EMPTY) || (state == LOAD_FIRST_DATA)
                       || (state == FIFO_FULL_STATE) || (state == LOAD_PARITY) ||
                          (state == LOAD_AFTER_FULL) || (state == CHECK_PARITY_ERROR);

assign write_enb_reg    = (state == LOAD_DATA) || (state == LOAD_AFTER_FULL) || (state == LOAD_PARITY);

assign lfd_state        = (state == LOAD_FIRST_DATA);

assign ld_state         = (state == LOAD_DATA);

assign full_state       = (state == FIFO_FULL_STATE);

assign laf_state        = (state == LOAD_AFTER_FULL);

assign rst_int_reg      = (state == CHECK_PARITY_ERROR);


endmodule