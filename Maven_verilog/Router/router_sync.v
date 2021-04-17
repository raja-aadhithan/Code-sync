module router_sync(input detect_add, write_enb_reg, clock, resetn, 
                         read_enb_0, read_enb_1, read_enb_2,
                         empty_0, empty_1, empty_2, 
                         full_0, full_1, full_2, 
                   input [1:0] data_in,
                   output reg vld_out_0, vld_out_1, vld_out_2,
                         soft_reset_0, soft_reset_1, soft_reset_2, 
                         fifo_full,
                   output reg [2:0] write_enb);

integer i,j,k;
reg [2:0] q;

always@(posedge clock) begin

    vld_out_0 <= !empty_0;
    vld_out_1 <= !empty_1;
    vld_out_2 <= !empty_2;

    case(data_in)
    2'b00 : begin
            fifo_full = full_0;
            write_enb = {2'b00, write_enb_reg};
            end 
   
    2'b01 : begin
            fifo_full = full_1;
            write_enb = {1'b0, write_enb_reg,1'b0};
            end
    
    2'b10 : begin
            fifo_full = full_2;
            write_enb = {write_enb_reg, 2'b00};
            end

    default : begin
                fifo_full = 0;
                write_enb = 3'd0;
    end
    endcase

    if (vld_out_0) begin
        for (i = 0; i<30; i = i+1)
        begin
            if (read_enb_0) q[0] <= 1'b1;
        end
        soft_reset_0 <= !q[0];
    end

    if (vld_out_1) begin
        for (j = 0; j<30; j = j+1)
        begin
            if (read_enb_1) q[1] <= 1'b1;
        end
        soft_reset_1 <= !q[1];
    end

    if (vld_out_2) begin
        for (k = 0; k<30; k = i+1)
        begin
            if (read_enb_2) q[2] <= 1'b1;
        end
        soft_reset_2 <= !q[2];
    end

end



endmodule//detect add resetn missing