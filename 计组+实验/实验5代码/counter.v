module ex5
(
clk, 
rst, q, 
overflow
);

input clk;
input rst;
output reg [3:0]q;
output overflow;
always@(posedge clk or negedge rst)
begin
	if(~rst)q<=4'h0;
	else
		begin
			if(4'h9==q)q<=4'h0;
			else q<=q+4'h1;
		end
	end
assign overflow = 4'h9 == q;
endmodule

