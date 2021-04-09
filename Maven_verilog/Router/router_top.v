module router_top(input clock, resetn, read_enb_0, read_enb_1, read_enb_2, pkt_valid,
                  input [7:0] data_in, output [7:0] data_out_0, data_out_1, data_out_2,
                  output valid_out_0, valid_out_1, valid_out_2, error, busy);
