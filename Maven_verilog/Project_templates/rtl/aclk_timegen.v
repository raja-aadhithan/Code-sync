module aclk_timegen(input clk,reset,reset_count,fast_watch, output reg one_minute, one_second);
reg [14:0] i = 15'b0;
always@(posedge clk or posedge reset)begin
    if(reset) begin
        one_minute <= 0;
        one_second <= 0;
    end
    else if(reset_count) begin
        one_minute <= 0;
        one_second <= 0;
        reset_count <= 0;
    end
    else if(!fast_watch)begin
            if (i%256 == 0) one_second <= 1;
            else one_second <= 0;
            if (i == 15360) begin
                one_minute <= 1;
                reset_count <= 1;
            end
            else one_minute <= 0;
            i = i + 1'b1;
        end
    end
    else if(fast_watch)begin
        if (i%256 == 0) one_minute <= 1;
        else one_minute <= 0;
            i = i + 1'b1;
    end
end
endmodule