`timescale 1ns/1ps
module Pulse_shortening_device_TB1;
parameter CLOCK_FREQUENCY=50000000;
reg IN_CLOCK,	IN_PULSE;
wire OUT_SHORT_PULSE;

localparam PERIOD_IN_CLOCK_NS=1000000000/CLOCK_FREQUENCY;


Pulse_shortening_device PSD (IN_CLOCK,IN_PULSE,OUT_SHORT_PULSE);

initial begin
	IN_CLOCK=0;
	IN_PULSE=0;
end

always 
begin
	#(PERIOD_IN_CLOCK_NS/2)
	IN_CLOCK=!IN_CLOCK;
end

initial begin
	#(PERIOD_IN_CLOCK_NS*5)
	IN_PULSE=1;
	#(PERIOD_IN_CLOCK_NS*5)
	IN_PULSE=0;
	#(PERIOD_IN_CLOCK_NS*4)
	IN_PULSE=1;
	#(PERIOD_IN_CLOCK_NS)
	IN_PULSE=0;
	#(PERIOD_IN_CLOCK_NS*4)
	IN_PULSE=1;
	#(PERIOD_IN_CLOCK_NS/4)
	IN_PULSE=0;	
end

	
endmodule
