module aclk_counter (input clk,reset,one_minute,load_new_c,
                input[3:0] new_current_time_ms_hr,new_current_time_ms_min,new_current_time_ls_hr,new_current_time_ls_min,
		        output reg [3:0] current_time_ms_hr,current_time_ms_min,current_time_ls_hr,current_time_ls_min);

// Define register to store current time

// Lodable Binary up synchronous Counter logic

// Write an always block with asynchronous reset
always@( posedge clk or posedge reset)                                         
 begin              
    // Check for reset signal and upon reset load the current_time register with default value (1'b0)                                                                                                       
    if(reset)
    // Else if there is no reset, then check for load_new_c signal and load new_current_time to current_time register
                                                                      //              0       0       0       9  -> 00:10
    // Else if there is no load_new_c signal, then check for one_minute signal and implement the counting algorithm

    // Check for the corner case
    // If the current_time is 23:59, then the next current_time will be 00:00
        
    // Else check if the current_time is 09:59, then the next current_time will be 10:00
     
    // Else check if the time represented by minutes is 59, Increment the LS_HR by 1 and set MS_MIN and LS_MIN to 1'b0
 
    // Else check if the LS_MIN is equal to 9, Increment the MS_MIN by 1 and set MS_MIN to 1'b0
	
    // Else just increment the LS_MIN by 1
     
    end

endmodule