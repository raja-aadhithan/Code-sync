module router_fifo(input clock, resetn, write_enb, read_enb, soft_reset, lfd_state,
           input [7:0]data_in,
           output full,empty,
           output reg [7:0]data_out);

        integer i;
        parameter width = 9,
                  depth = 16,
                  addr = 4;


        reg [width-1:0]mem[depth-1:0];
        reg [addr:0]wr_ptr, rd_ptr;
        reg [5:0]count;


   always@(posedge clock or negedge resetn or posedge soft_reset)
        begin
      if(!resetn || soft_reset)
         begin
         for(i=0;i<depth;i=i+1)
                mem[i]<=0;
         end
        else
                begin
                        if(write_enb && !full)
                         mem[wr_ptr[addr-1:0]]<={lfd_state,data_in};
                end
        end

        always@(posedge clock or negedge resetn or posedge soft_reset)
        begin
      if(!resetn)
                data_out <= 0;
         else if(soft_reset)
                data_out <= 8'bz;
        else if (read_enb && !empty)
                data_out <= mem[rd_ptr[addr-1:0]];
  else if(count==0 && data_out!=0)
                data_out <= 8'bz;
        end


        always@(posedge clock or negedge resetn or posedge soft_reset)
         begin
                if(!resetn || soft_reset)
                 begin
                  wr_ptr <= 0;
                  rd_ptr <= 0;
                 end
                else
                begin
                        if(write_enb && !full)
                         wr_ptr <= wr_ptr+1;
                        if (read_enb && !empty)
                         rd_ptr <= rd_ptr+1;
                 end
         end


         always@(posedge clock or negedge resetn or posedge soft_reset)
         begin
                if(!resetn || soft_reset)
                 begin
                  count <= 0;
                 end
                else
                begin
                        if (read_enb && !empty)
                        begin
                         if(mem[rd_ptr[addr-1:0]][width-1]==1)
                                count <= mem[rd_ptr[addr-1:0]][7:2]+1;
                        else
                                count <= count-1;
                        end
                 end
         end

        assign full = (wr_ptr == {~rd_ptr[addr], rd_ptr[addr-1:0]})?1:0;
        assign empty = (wr_ptr == rd_ptr);

endmodule
                                            