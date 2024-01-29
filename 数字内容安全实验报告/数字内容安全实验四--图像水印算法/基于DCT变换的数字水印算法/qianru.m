function [waterimage] = qianru( path1,path2,k1,k2 )

carry = imread(path1);
water = imread(path2)
watermark = water
%watermark = rgb2gray(water);
mark = im2bw(watermark);
marksize = size(mark);
rm = marksize(1);
cm = marksize(2);

I = mark;
alpha=30;

yuv=rgb2ycbcr(carry);
Y=yuv(:,:,1);
U=yuv(:,:,2);
V=yuv(:,:,3);
before=blkproc(U,[8 8],'dct2');

after=before;
for i=1:rm
    for j=1:cm
        x=(i-1)*8;
        y=(j-1)*8;
        if mark(i,j)==1
            k=k1;
        else
            k=k2;
        end;
        after(x+1,y+8)=before(x+1,y+8)+alpha*k(1);
        after(x+2,y+7)=before(x+2,y+7)+alpha*k(2);
        after(x+3,y+6)=before(x+3,y+6)+alpha*k(3);
        after(x+4,y+5)=before(x+4,y+5)+alpha*k(4);
        after(x+5,y+4)=before(x+5,y+4)+alpha*k(5);
        after(x+6,y+3)=before(x+6,y+3)+alpha*k(6);
        after(x+7,y+2)=before(x+7,y+2)+alpha*k(7);
        after(x+8,y+1)=before(x+8,y+1)+alpha*k(8);
    end;
end;
result=blkproc(after,[8 8],'idct2');
yuv_after=cat(3,Y,result,V);
waterimage=ycbcr2rgb(yuv_after);
global pathfile3;
global pathfre;
pathfile3=fullfile(pathfre, 'waterimage.bmp');
imwrite(waterimage,pathfile3); 

end