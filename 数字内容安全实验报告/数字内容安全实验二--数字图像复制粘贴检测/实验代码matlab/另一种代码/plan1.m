clc;clear;close all;
fixed = rgb2gray(imread('A.png')); %����ͼ��ת��Ϊ�Ҷ�ͼ
moving = rgb2gray(imread('B.png'));

[optimizer,metric] = imregconfig('multimodal');
    optimizer.MaximumIterations = 15; %��������
    optimizer.InitialRadius = optimizer.InitialRadius/100;

movingRegister = imregister(moving,fixed,'translation',optimizer,metric);%��׼
 
tformSimilarity = imregtform(moving,fixed,'translation',optimizer,metric);%��任����
Rfixed = imref2d(size(fixed));
movingRegisteredRigid = imwarp(moving,tformSimilarity,'OutputView',Rfixed);%moving �任

I=(movingRegisteredRigid-fixed)+(fixed-movingRegisteredRigid);%�����ͼ�����
thresh = 0.1; %��ֵ����ֵ
BW = im2bw(I,thresh); %��ͼ���ֵ��
% % % imshowpair(fixed,movingRegisteredRigid,'falsecolor');
subplot(2,2,1),imshow(fixed);title('�Ҷ�ԭʼͼ��A');
subplot(2,2,2),imshow(moving);title('�Ҷ�ԭʼͼ��B');
subplot(2,2,3),imshow(I);title('�۸Ĳ���Ҷ�ͼ');
subplot(2,2,4),imshow(BW);title('�۸Ĳ����ֵͼ');



