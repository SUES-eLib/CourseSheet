function [ water ] = tiqu(path3,k1,k2)

watermark = imread(path3);
imshow(watermark);
U_2=watermark(:,:,2);
after_2=blkproc(U_2,[8,8],'dct2');

p=zeros(1,8);
for i=1:64
for j=1:64
x=(i-1)*8;y=(j-1)*8;
p(1)=after_2(x+1,y+8);
p(2)=after_2(x+2,y+7);
p(3)=after_2(x+3,y+6);
p(4)=after_2(x+4,y+5);
p(5)=after_2(x+5,y+4);
p(6)=after_2(x+6,y+3);
p(7)=after_2(x+7,y+2);
p(8)=after_2(x+8,y+1);
if corr2(p,k1)>corr2(p,k2)
water(i,j)=0;
else
water(i,j)=1;
end
end
end
global pathfile4;
global pathfre;
pathfile4=fullfile(pathfre, 'randmark.bmp');
imwrite(water,pathfile4)
end