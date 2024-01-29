%�����ֵ�����PSNR��ֵ
%����IΪԭʼ��ͼ��JΪ���������ͼ��

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