

%ary ��ʾ�Ǹ�������,1����ͱ���λ
ary = 1;

file_name1 = '4.PNG';
cover_object = imread(file_name1);      %��ȡ������Ƭ��Ϣ
cover_object = rgb2gray(cover_object);      %�õ��Ҷ�ͼ��Ϣ
cover_object_ll = bitget(cover_object, ary);        %�õ����1λ����
 
figure;     %����һ������
imshow(cover_object);
title('origin host picture');   %չʾԭͼ���γɵĻҶ�ͼ
 
figure;
imshow(255*cover_object_ll);            %���λ���Ƶ����λ
title('origin hot pic`lowest bit');     %չʾԭͼ������λ
 
file_name2 = 'Finger.bmp';
message = imread(file_name2);

figure;
imshow(message);

message = im2bw(message, graythresh(message));      %��ָ��ͼ���Ϊ��ֵͼ

figure;
imshow(message);
title('hidden picture');
 
Mc = size(cover_object, 1); %Height   ��ȡͼƬ�Ĵ�С
Nc = size(cover_object, 2); %Width

message = imresize(message, [Mc Nc]);       %ʹ������ͼƬ������ͼƬ�ȳ���

watermarked_image = cover_object;

%ʹ������ͼƬ�����һ������λ���뱻����ͼƬ���������
for ii = 1 : Mc
	for jj = 1 : Nc
		if ii*jj < Mc * Nc              %С��ָ����Ϣ��ͼƬ��С
			if cover_object_ll(ii, jj) ~= message(ii, jj)     %�������˲���ȣ����Ϊһ
				if cover_object_ll(ii, jj) == 1
				watermarked_image(ii, jj) = bitset(watermarked_image(ii,jj), ary, 0);   %����ȸ�Ϊ0
				else
				watermarked_image(ii, jj) = bitset(watermarked_image(ii,jj), ary, 1);
				end
			end
		end
	end
end

figure;
imshow(watermarked_image);
title('watermarked picture');
saveas(gcf, 'ok.bmp');
figure;
watermarked_image_ll = bitget(watermarked_image, ary);
imshow(255 * watermarked_image_ll);
title('watermarked picture`s lowest bit');

file = 'ok.bmp'
water_pic = imread(file); %����ȡͼ��
water_pic_1 = bitget(water_pic, 1);        %�õ����1λ����

figure;
imshow(water_pic);

figure;
imshow(255*water_pic_1);
saveas(gcf, 'abstarct.bmp');
