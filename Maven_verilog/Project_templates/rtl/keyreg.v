module aclk_keyreg(reset,
              clock,
              shift,
              key,
              key_buffer_ls_min,
              key_buffer_ms_min,
              key_buffer_ls_hr,
              key_buffer_ms_hr);
// Define input and output port direction




///////////////////////////////////////////////////////////////////
// This procedure stores the last 4 keys pressed. The FSM block
// detects the new key value and triggers the shift pulse to shift
// in the new key value.
///////////////////////////////////////////////////////////////////
always @(posedge clock or posedge reset)
begin
  // For asynchronous reset, reset the key_buffer output register to 1'b0

  // Else if there is a shift, perform left shift from LS_MIN to MS_HR
 
end

endmodule
