function [randwater] = Arnold1(waterpath)
water = imread(waterpath);
I=rgb2gray(water);
[h w]=size(I);
%置乱与复原的共同参数
n=10;
a=3;b=5;
N=h;
%置乱
C=zeros(h,w);
for i=1:n
    for y=1:h
        for x=1:w           
            xx=mod((x-1)+b*(y-1),N)+1;           %新像素行位置
            yy=mod(a*(x-1)+(a*b+1)*(y-1),N)+1;   %新像素列位置     
            C(xx,yy)=I(x,y);                
        end
    end
    I=C;
end
randwater = C;
end
%figure;
%imshow(C,[])