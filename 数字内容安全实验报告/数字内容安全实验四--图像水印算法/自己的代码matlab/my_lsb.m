
Figure_name = 'mxt.png';%����ë��ͮ�����ͼ
rgb_fig = imread(Figure_name);      
gray = rgb2gray(rgb_fig);%�ҶȾ���
[m,n]=size(gray);%�ҶȾ�������
key=randsrc(m,n,[0,1]);%������ɼ��ܾ���
t_gray=ones(m,n)*nan;%Ԥ�ȷ���ռ�
t_key=ones(m,n)*nan;
result_key=ones(m,n)*nan;
for i=1:m
    for j=1:n
        t_gray(i,j)=str2double(dec2bin(gray(i,j)));%�ҶȾ���Ϊ�����ƣ��˴�����������
%       b=num2str(t_gray(i,j));
%       b=replaceBetween(b,size(b,2),size(b,2),num2str(key(i,j)));%��ÿ�����ص��ֵ�Ķ�����λ�����һλ����Ϊ�����������Կ
        result_key(i,j)=bin2dec(num2str(bitor(t_gray(i,j),key(i,j))));%bitor�����ܾ���ͻҶȾ�������Ƶ����һλ�������㣨LSB�㷨���Ĳ��֣�
%       t_key(i,j)=str2double(b);
%       result_key(i,j)=bin2dec(b);
    end
end
gray_result=mat2gray(result_key);
sub_key=double(gray)-result_key;%�����Ϊ�˳��ֳ�ͼ���΢С�仯��ͨ�������ֵ
%��ͼ����
subplot(2,2,1);
imshow('mxt.png');
title('ԭʼ��ɫͼ��');   %չʾԭͼ��
subplot(2,2,2);%121
imshow(gray);
title('ԭʼ�Ҷ�ͼ��');   %չʾԭͼ���γɵĻҶ�ͼ
subplot(2,2,3)
imshow(gray_result);
title('ˮӡ���ܺ�ĻҶ�ͼ��');   
subplot(2,2,4)
imshow(mat2gray(abs(sub_key)));
title('ˮӡ');   