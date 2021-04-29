module vending(input clk,reset,input [1:0]coin, output pr_en);
reg s;
reg [10:0] count;
parameter s0 = 000, s25 = 001, s50 = 010, s75 = 011, s100 = 100;
reg [2:0] state , next_state;

always@(*)begin
    case(state)
    s0 : next_state = coin[1] ? (coin [0] ? s0 : s100) : (coin [0] ? s50 : s25) ;
    s25 : next_state =  coin[1] ? (coin [0] ?  s25 :  s100) : (coin [0] ?  s75 :  s50) ;
    s50 :next_state =  coin[1] ? (coin [0] ?  s50 :  s100) : (coin [0] ?  s100 :  s75) ;
    s75 : next_state = coin[1] ? (coin [0] ?  s75 :  s100) : (coin [0] ?  s100 :  s100) ;
    s100 : next_state = s0;
    default : next_state = s0;

    endcase
end

always@(posedge clk)begin
    if(reset) state <= s0;
    else if(!s) state <= s0;
    else begin
        state<= next_state;
        s =1'b1;
        if(coin != 2'b11) count <= 11'd0;
end 
end

always@(posedge clk)begin
    if(state == next_state)begin
        count <= count + 1'b1;
        if(count == 11'd1280) s <= 1'b0;
    end
end

assign pr_rn = (state == s100);
endmodule