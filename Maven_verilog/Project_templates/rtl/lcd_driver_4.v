module lcd_driver_4 (input[3:0] alarm_time_ms_hr, alarm_time_ls_hr, alarm_time_ms_min, alarm_time_ls_min,
                        current_time_ms_hr, current_time_ls_hr, current_time_ms_min, current_time_ls_min,
                        key_ms_hr, key_ls_hr, key_ms_min, key_ls_min,

                      input show_a, show_current_time,

                      output [3:0] display_ms_hr, display_ls_hr, display_ms_min, display_ls_min,

                      output reg sound_a);

wire sound_alarm1,sound_alarm2,sound_alarm3,sound_alarm4;
// Assert sound_a when all 4 digits matches
always@(*) begin
        sound_a = 1'b0;
        if (alarm_time_ms_hr == current_time_ms_hr)begin
           if (alarm_time_ls_hr == current_time_ls_hr)begin
                if (alarm_time_ms_min == current_time_ms_min)begin
                        if (alarm_time_ls_min == current_time_ls_min)begin  
                                sound_a = 1'b1;
                        end 
                end
           end   
        end
end

//Instantiate lcd_driver as MS_HR_display
aclk_lcd_driver MS_HR (.alarm_time(alarm_time_ms_hr), 
                  .current_time(current_time_ms_hr),
                  .key(key_ms_hr),
                  .show_alarm(show_a),
                  .show_new_time(show_current_time),
                  .display_time(display_ms_hr),
                  .sound_alarm(sound_alarm1));
//Instantiate lcd_driver as LS_HR_display
aclk_lcd_driver LS_HR (.alarm_time(alarm_time_ls_hr), 
                  .current_time(current_time_ls_hr),
                  .key(key_ls_hr),
                  .show_alarm(show_a),
                  .show_new_time(show_current_time),
                  .display_time(display_ls_hr),
                  .sound_alarm(sound_alarm1));

//Instantiate lcd_driver as MS_MIN_display
aclk_lcd_driver MS_MIN (.alarm_time(alarm_time_ms_min), 
                  .current_time(current_time_ms_min),
                  .key(key_ms_min),
                  .show_alarm(show_a),
                  .show_new_time(show_current_time),
                  .display_time(display_ms_min),
                  .sound_alarm(sound_alarm1));

//Instantiate lcd_driver as LS_MIN_display
aclk_lcd_driver LS_MIN (.alarm_time(alarm_time_ls_min), 
                  .current_time(current_time_ls_min),
                  .key(key_ls_min),
                  .show_alarm(show_a),
                  .show_new_time(show_current_time),
                  .display_time(display_ls_min),
                  .sound_alarm(sound_alarm1));


endmodule