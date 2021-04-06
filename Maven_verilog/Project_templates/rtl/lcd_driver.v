module lcd_driver (input [3:0] alarm_time,key,current_time,input show_alarm,show_new_time,output reg [7:0] display_time,output reg sound_alarm);

//Define the internal signals  
reg [3:0]display_value ;

//Define the Parameter constants to represent LCD numbers
parameter ZERO = 8'h30,ONE = 8'h31,TWO = 8'h32, THREE = 8'h33, FOUR = 8'h34, FIVE = 8'h35,
          SIX = 8'h36, SEVEN = 8'h37, EIGHT = 8'h38, NINE = 8'h39, ERROR  = 8'h3A;

always @ (alarm_time or current_time or show_alarm or show_new_time or key)
  begin
    //Displays the key_time,alarm_time or current_time as per the control signals

    //Generates sound_alarm logic i,e when current_time is equal to alarm_time

  end

//Decoder logic 
always @ (display_value)
  begin
    // For number stored in display_value register, load display_time register with LCD equivalent
    case (display_value)
          
       default : display_time = ERROR;
    endcase
   end 


endmodule	    