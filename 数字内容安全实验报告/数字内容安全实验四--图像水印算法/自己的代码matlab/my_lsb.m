
Figure_name = 'mxt.png';%输入毛晓彤人像彩图
rgb_fig = imread(Figure_name);      
gray = rgb2gray(rgb_fig);%灰度矩阵
[m,n]=size(gray);%灰度矩阵行列
key=randsrc(m,n,[0,1]);%随机生成加密矩阵
t_gray=ones(m,n)*nan;%预先分配空间
t_key=ones(m,n)*nan;
result_key=ones(m,n)*nan;
for i=1:m
    for j=1:n
        t_gray(i,j)=str2double(dec2bin(gray(i,j)));%灰度矩阵化为二进制（此处运行略慢）
%       b=num2str(t_gray(i,j));
%       b=replaceBetween(b,size(b,2),size(b,2),num2str(key(i,j)));%把每个像素点的值的二进制位的最后一位更改为随机产生的秘钥
        result_key(i,j)=bin2dec(num2str(bitor(t_gray(i,j),key(i,j))));%bitor将加密矩阵和灰度矩阵二进制的最后一位作与运算（LSB算法核心部分）
%       t_key(i,j)=str2double(b);
%       result_key(i,j)=bin2dec(b);
    end
end
gray_result=mat2gray(result_key);
sub_key=double(gray)-result_key;%这个是为了呈现出图像的微小变化，通过矩阵的值
%作图部分
subplot(2,2,1);
imshow('mxt.png');
title('原始彩色图像');   %展示原图像
subplot(2,2,2);%121
imshow(gray);
title('原始灰度图像');   %展示原图像形成的灰度图
subplot(2,2,3)
imshow(gray_result);
title('水印加密后的灰度图像');   
subplot(2,2,4)
imshow(mat2gray(abs(sub_key)));
title('水印');   