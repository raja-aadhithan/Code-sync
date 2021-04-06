module alarm_clock_top(clock,
	               key,
		       reset,
		       time_button,
		       alarm_button,
		       stopwatch,
		       ms_hour,
		       ls_hour,
		       ms_minute,
		       ls_minute,
		       alarm_sound);
// Define port directions for the signals


//Define the Interconnecting internal wires


//Instantiate lower sub-modules. Use interconnect(Internal) signals for connecting the sub modules
// Instantiate the timing generator module


// Instantiate the counter module


// Instantiate the alarm register module


// Instantiate the key register module


// Instantiate the FSM controller

// Instantiate the lcd_driver_4 module


endmodule