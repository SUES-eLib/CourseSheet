

%ary 表示那个比特面,1是最低比特位
ary = 1;

file_name1 = '4.PNG';
cover_object = imread(file_name1);      %读取本人照片信息
cover_object = rgb2gray(cover_object);      %得到灰度图信息
cover_object_ll = bitget(cover_object, ary);        %得到最后1位比特
 
figure;     %唤醒一个窗口
imshow(cover_object);
title('origin host picture');   %展示原图像形成的灰度图
 
figure;
imshow(255*cover_object_ll);            %最低位左移到最高位
title('origin hot pic`lowest bit');     %展示原图像的最低位
 
file_name2 = 'Finger.bmp';
message = imread(file_name2);

figure;
imshow(message);

message = im2bw(message, graythresh(message));      %将指纹图像变为二值图

figure;
imshow(message);
title('hidden picture');
 
Mc = size(cover_object, 1); %Height   读取图片的大小
Nc = size(cover_object, 2); %Width

message = imresize(message, [Mc Nc]);       %使被隐藏图片和载体图片等长宽

watermarked_image = cover_object;

%使得载体图片的最后一个比特位，与被隐藏图片的数据相等
for ii = 1 : Mc
	for jj = 1 : Nc
		if ii*jj < Mc * Nc              %小于指纹信息的图片大小
			if cover_object_ll(ii, jj) ~= message(ii, jj)     %左右两端不相等，结果为一
				if cover_object_ll(ii, jj) == 1
				watermarked_image(ii, jj) = bitset(watermarked_image(ii,jj), ary, 0);   %不相等改为0
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
water_pic = imread(file); %待提取图像
water_pic_1 = bitget(water_pic, 1);        %得到最后1位比特

figure;
imshow(water_pic);

figure;
imshow(255*water_pic_1);
saveas(gcf, 'abstarct.bmp');
