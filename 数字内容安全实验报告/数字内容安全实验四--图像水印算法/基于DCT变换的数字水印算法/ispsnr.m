%计算峰值信噪比PSNR的值
%参数I为原始的图像，J为添加噪声的图像

function [ PSNR ] = ispsnr( I,J )
width = size(I,2);  
heigh = size(I,1);  
if( width ~= size(J,2) || heigh ~= size(J,1) )  
    disp('Please check the input image have the same size');  
    return  
end  
K = (I-J).*(I-J);  
PSNR = sum(sum(K,1));  
PSNR = PSNR / (width * heigh);  
PSNR=10*log10(255*255/PSNR);  
end  