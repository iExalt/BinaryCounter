module counter (clk, led);	
		// declare inputs
		// pins are in pin planner/DE0-Nano User Guide
		input clk;
		output reg [7:0] led; 
	


reg [31:0] counter;
integer i;


always @ (posedge clk)
begin
	// 50MHz internal clock
	// 25M clock cycles = 0.5s
	if (counter <= 25000000)
	begin
		counter <= counter + 1;
	end
	
	// reset counter at the 25 millionth tick
	// add one digit to the reset counter for every consecutive 1 bit
	// implementation based on incrementing a binary register
	// and reading the bits would be faster
	else
	begin
		counter <= 0;
		if (led[0] == 1)
		begin
			i = i + 1;
			if (led[1] == 1)
			begin
				i = i + 1;
				if (led[2] == 1)
				begin
					i = i + 1;
					if (led[3] == 1)
					begin
						i = i + 1;
						if (led[4] == 1)
						begin
							i = i + 1;
							if (led[5] == 1)
							begin
								i = i + 1;
								if (led[6] == 1)
								begin
									i = i + 1;
									if (led[7] == 1)
									begin
										led = 0;
									end
									else 
									begin
										led[7] = 1;
									end
								end
								else 
								begin
									led[6] = 1;
								end
							end
							else 
							begin
								led[5] = 1;
							end
						end	
						else 
						begin
							led[4] = 1;
						end
					end
					else
					begin
						led[3] = 1;
					end
				end
				else 
				begin
					led[2] = 1;
				end
			end
			else
			begin
				led[1] = 1;
			end
		end
		if (led[0] == 0)
		begin
			led[0] = 1;
		end

		// reset previous bits after carryover
		for (reg [7:0] j = 0; j < i & j < 7; j = j + 1)
		begin
			led[j] = 0;
		end
		//reset i
		i = 0;

	end	
end


endmodule
