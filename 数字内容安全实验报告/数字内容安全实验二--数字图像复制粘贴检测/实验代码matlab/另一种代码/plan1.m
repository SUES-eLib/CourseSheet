clc;clear;close all;
fixed = rgb2gray(imread('A.png')); %读入图像并转化为灰度图
moving = rgb2gray(imread('B.png'));

[optimizer,metric] = imregconfig('multimodal');
    optimizer.MaximumIterations = 15; %迭代次数
    optimizer.InitialRadius = optimizer.InitialRadius/100;

movingRegister = imregister(moving,fixed,'translation',optimizer,metric);%配准
 
tformSimilarity = imregtform(moving,fixed,'translation',optimizer,metric);%求变换矩阵
Rfixed = imref2d(size(fixed));
movingRegisteredRigid = imwarp(moving,tformSimilarity,'OutputView',Rfixed);%moving 变换

I=(movingRegisteredRigid-fixed)+(fixed-movingRegisteredRigid);%对齐后图像相减
thresh = 0.1; %二值化阈值
BW = im2bw(I,thresh); %对图像二值化
% % % imshowpair(fixed,movingRegisteredRigid,'falsecolor');
subplot(2,2,1),imshow(fixed);title('灰度原始图像A');
subplot(2,2,2),imshow(moving);title('灰度原始图像B');
subplot(2,2,3),imshow(I);title('篡改差异灰度图');
subplot(2,2,4),imshow(BW);title('篡改差异二值图');



