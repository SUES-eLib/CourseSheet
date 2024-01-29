module decode
(
input wire[1:0] a,
input wire en,
output reg[3:0] y
);

integer i;
always @(*)begin
if(en==1)
	for(i=0;i<4;i=i+1)begin
		if(a==i)
			y[i]=1;
		else
			y[i]=0;
		end
else
	for(i=0;i<4;i=i+1)begin
		y[i]=0;
	end

end
endmodule
