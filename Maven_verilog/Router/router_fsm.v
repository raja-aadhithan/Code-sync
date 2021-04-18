module router_fsm(input clock, resetn, pkt_valid, parity_done,
                        soft_reset_0, soft_reset_1, soft_reset_2,
                        fifo_full, low_pkt_valid, 
                        fifo_empty_0, fifo_empty_1, fifo_empty_2,
                        input [1:0] data_in,
                        output busy, detect_add, ld_state, laf_state,
                        full_state, write_enb_reg, rst_int_reg, lfd_state);
parameter Decode_Address = 3'b000, 
          Load_First_Data = 3'b001,
          Wait_Till_Empty = 3'b101,
          Load_Data = 3'b011,
          Check_Parity_Error = 3'b100,
          Load_Parity = 3'b101,
          Fifo_Full_State = 3'b110,
          Load_After_Full = 3'b111;
reg [2:0] state, next_state;