module counter (clk, led);	
		input clk;
		output reg [7:0] led; 
	


reg [31:0] counter;
integer i;


always @ (posedge clk)
begin
	if (counter <= 25000000)
	begin
		counter <= counter + 1;
	end

	else
	begin
		counter <= 0;

		if (led[0] == 1)
		begin
			i= i + 1;
			if (led[1] == 1)
			begin
				i= i + 1;
				if (led[2] == 1)
				begin
					i= i + 1;
					if (led[3] == 1)
					begin
						i= i + 1;
						if (led[4] == 1)
						begin
							i= i + 1;
							if (led[5] == 1)
							begin
								i= i + 1;
								if (led[6] == 1)
								begin
									i= i + 1;
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

		for (reg [7:0] j = 0; j < i & j < 7; j = j + 1)
		begin
			led[j] = 0;
		end

		i = 0;

	end
	
	
end


endmodule
