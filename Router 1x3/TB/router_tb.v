module router_top_tb();

        reg clock, resetn, pkt_valid,
                read_enb_0, read_enb_1, read_enb_2;
        reg [7:0]data_in;
        wire valid_out_0, valid_out_1, valid_out_2, error, busy;
        wire [7:0]data_out_0, data_out_1, data_out_2;

        router_top DUT(clock, resetn, pkt_valid,
                                read_enb_0, read_enb_1, read_enb_2, data_in,
                                valid_out_0, valid_out_1, valid_out_2, error, busy,
                                data_out_0, data_out_1, data_out_2);

        //Define a parameter with name "CYCLE" which is equal to 10
        parameter CYCLE = 10;
        parameter duty_cycle = 50;

   //Understand the clock generation logic
   always
      begin
         #(CYCLE*(duty_cycle/100.0));
         clock = 1'b0;
         #(CYCLE*(1-(duty_cycle/100.0)));
         clock=~clock;
      end

        //Tasks for Initialising the inputs
   task initialize();
      begin
                 resetn=1'b1; pkt_valid=1'b0;
                 read_enb_0=1'b0; read_enb_1=1'b0; read_enb_2=1'b0;
                 data_in=8'b0;
      end
   endtask

   task reset();
      begin
         @(negedge clock);
          resetn = 1'b0;
         @(negedge clock);
          resetn = 1'b1;
      end
   endtask

   task delay;
      begin
         #50;
      end
   endtask
       
   task pkt_gen;
        reg [7:0] payload_data,parity,header;
        reg [5:0] payload_len;
          reg [1:0] addr;
          integer i;
          begin
                repeat(3)
                begin
           @(negedge clock)
           payload_len=6'd15;
           addr=2'b10;//valid packet
           header={payload_len,addr};
           data_in=header;
           parity = 0 ^ data_in;
           pkt_valid = 1'b1;
           end
           for(i=0;i<payload_len;i=i+1)
                begin
                 @(negedge clock)
                 payload_data={$random}%256;
                 data_in=payload_data;
                parity = parity ^ data_in;
                end
           @(negedge clock)
                pkt_valid = 0;
                data_in=parity;
                @(negedge clock)
                data_in = 8'bx;
          end
    endtask

   initial
                begin
                initialize;
                reset;
                pkt_gen;
                delay;
                read_enb_2 = 1'b1;
                delay;
                #500;
                $finish;
                end

endmodule
                                       