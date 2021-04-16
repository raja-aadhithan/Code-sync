module router_fifo(input clock, resetn, write_enb, read_enb, soft_reset, lfd_state,
                   input [7:0] data_in, output full, empty, output reg [7:0] data_out);

reg [8:0] mem [0:15];
reg [3:0] rd_pointer, wr_pointer;
reg [8:0] packet_out;
wire [8:0]packet;
reg [5:0] length;
reg [4:0] status_count = 0;

assign empty = (status_count == 0 ) ? 1'b1 : 1'b0 ;
assign full = (status_count == 5'd16) ? 1'b1 : 1'b0 ;
assign packet[7:0] = data_in[7:0];
assign packet[8] = lfd_state;
assign data_out = packet_out[7:0];

always@(posedge clock) begin
    if(!resetn || soft_reset) begin
        data_out <= 8'd0;
        rd_pointer <= 4'd0;
        wr_pointer <= 4'd0;
    end
    else begin
        if(full == 1'b0 && write_enb) begin
            mem[wr_pointer[3:0]] <= packet;
            wr_pointer <= wr_pointer + 1'b1;
            status_count <= status_count + 1'b1;
        end
        if(empty == 1'b0 && read_enb) begin
            packet_out <= mem[rd_pointer[3:0]];
            rd_pointer <= rd_pointer + 1'b1;
            status_count <= status_count - 1'b1;
            
            if(packet_out[8])begin
                length <= packet_out[7:2] - 1;
            end
            
            else if (length != 0) 
            begin
                length <= length - 1'b1;
            end
            
           
        end
    end
end

endmodule