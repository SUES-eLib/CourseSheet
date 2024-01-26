function [imageRGB, descriptors, locs] = sift(imageFile)
%%功能：读取一幅图像，并返回它的SIFT关键点信息
%  输入:
%     imageFile: 图片文件名
%
%  输出: 
%     imageRGB: 原始图像矩阵
%     descriptors: 一个Kx128大小的矩阵; k是找到的关键点个数;每一行都为单位向量
%     locs:一个Kx4大小的矩阵, 每行包括关键点的四个值(行数，列数，关键点尺度半径，方向角)

%加载图像
image = imread(imageFile);
imageRGB = image;
%如果原图像是彩色图像的话，把彩色图像转化为灰度图像
if size(image,3)
   image = rgb2gray(image);
end
%获取图像的尺寸
[rows, cols] = size(image); 


% 转化成PGM文件,为了能使 "keypoints" 可以执行
f = fopen('tmp.pgm', 'w');
if f == -1
    error('不能读取tmp.pgm文件。');
end
fprintf(f, 'P5\n%d\n%d\n255\n', cols, rows);
fwrite(f, image', 'uint8');
fclose(f);

% 调用"keypoints" 执行
if isunix
    command = '!./sift ';
else
    command = '!siftWin32 ';
end
command = [command ' <tmp.pgm >tmp.key'];
eval(command);

% 打开tmp.key并检查其头文件
g = fopen('tmp.key', 'r');
if g == -1
    error('不能打开tmp.key文件。');
end
[header, count] = fscanf(g, '%d %d', [1 2]);
if count ~= 2
    error('无效的“keypoint”文件。');
end
num = header(1);
len = header(2);
if len ~= 128
    error('关键点描绘子长度不对，应该是128！');
end

% 使用已知的图像尺寸创建两幅输出图像
locs = double(zeros(num, 4));
descriptors = double(zeros(num, 128));

% 	分析“tmp.key”
for i = 1:num
    [vector, count] = fscanf(g, '%f %f %f %f', [1 4]); %行数、列数、尺度半径、方向
    if count ~= 4
        error('无效的“keypoint”文件格式');
    end
    locs(i, :) = vector(1, :);
    
    [descrip, count] = fscanf(g, '%d', [1 len]);
    if (count ~= 128)
        error('无效的“keypoint”文件值');
    end
    % 单位化每个输入向量
    descrip = descrip / sqrt(sum(descrip.^2));
    descriptors(i, :) = descrip(1, :);
end
%关闭文件
fclose(g);
delete tmp.key
delete tmp.pgm


