function [imageRGB, descriptors, locs] = sift(imageFile)
%%���ܣ���ȡһ��ͼ�񣬲���������SIFT�ؼ�����Ϣ
%  ����:
%     imageFile: ͼƬ�ļ���
%
%  ���: 
%     imageRGB: ԭʼͼ�����
%     descriptors: һ��Kx128��С�ľ���; k���ҵ��Ĺؼ������;ÿһ�ж�Ϊ��λ����
%     locs:һ��Kx4��С�ľ���, ÿ�а����ؼ�����ĸ�ֵ(�������������ؼ���߶Ȱ뾶�������)

%����ͼ��
image = imread(imageFile);
imageRGB = image;
%���ԭͼ���ǲ�ɫͼ��Ļ����Ѳ�ɫͼ��ת��Ϊ�Ҷ�ͼ��
if size(image,3)
   image = rgb2gray(image);
end
%��ȡͼ��ĳߴ�
[rows, cols] = size(image); 


% ת����PGM�ļ�,Ϊ����ʹ "keypoints" ����ִ��
f = fopen('tmp.pgm', 'w');
if f == -1
    error('���ܶ�ȡtmp.pgm�ļ���');
end
fprintf(f, 'P5\n%d\n%d\n255\n', cols, rows);
fwrite(f, image', 'uint8');
fclose(f);

% ����"keypoints" ִ��
if isunix
    command = '!./sift ';
else
    command = '!siftWin32 ';
end
command = [command ' <tmp.pgm >tmp.key'];
eval(command);

% ��tmp.key�������ͷ�ļ�
g = fopen('tmp.key', 'r');
if g == -1
    error('���ܴ�tmp.key�ļ���');
end
[header, count] = fscanf(g, '%d %d', [1 2]);
if count ~= 2
    error('��Ч�ġ�keypoint���ļ���');
end
num = header(1);
len = header(2);
if len ~= 128
    error('�ؼ�������ӳ��Ȳ��ԣ�Ӧ����128��');
end

% ʹ����֪��ͼ��ߴ紴���������ͼ��
locs = double(zeros(num, 4));
descriptors = double(zeros(num, 128));

% 	������tmp.key��
for i = 1:num
    [vector, count] = fscanf(g, '%f %f %f %f', [1 4]); %�������������߶Ȱ뾶������
    if count ~= 4
        error('��Ч�ġ�keypoint���ļ���ʽ');
    end
    locs(i, :) = vector(1, :);
    
    [descrip, count] = fscanf(g, '%d', [1 len]);
    if (count ~= 128)
        error('��Ч�ġ�keypoint���ļ�ֵ');
    end
    % ��λ��ÿ����������
    descrip = descrip / sqrt(sum(descrip.^2));
    descriptors(i, :) = descrip(1, :);
end
%�ر��ļ�
fclose(g);
delete tmp.key
delete tmp.pgm


