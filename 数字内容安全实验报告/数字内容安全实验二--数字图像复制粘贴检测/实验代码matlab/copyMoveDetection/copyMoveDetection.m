function  copyMoveDetection(imageName,threshold)
%%功能:检测同一副数字图像中复制粘贴的区域
%输入:
%  imageName:输入图像的文件名(包含扩展名)，例如:'CRW_4901_JFRtamp25.jpg'
%  threshold:阈值，范围为：(0,1)，默认为0.4
%输出:
%  检测结果

%SIFT主算法
[im, des, loc] = sift(imageName);

%检测输入变量个数
if nargin<2 
    threshold= 0.4;   %默认阈值
end
 match = ones(1,size(des,1));
 %循环找匹配点
    for i = 1 : size(des,1)
        %求行向量des(i,:) 与矩阵des中每一行向量的欧几里得距离
        distance_I_other = distanceVectorMatrix(des(i,:),des);
        %将算的结果按从小到大排序
       [vals,indx] = sort(distance_I_other);  
        %求匹配特征点
       if (vals(2) < threshold * vals(3))
          match(i) = indx(2);%如果特征点i与其它特征点的最近距离和次最近距离的比值小于阈值threshold的话，
       else                         %就认为这个最近距离的特征点 indx(2)与特征点i匹配。
          match(i) = 0;         %这里舍去了indx(1)是因为该点代表特征点i自身
       end
    end
    
% 显示最终的点线匹配图.
%前三行显示原始灰度图像
    figure('Position', [100 100 size(im,2) size(im,1)]);
    colormap('gray');
    imagesc(im);
%在原图上继续画线
    hold on;
    %画连接线
    for i = 1: size(des,1)
      if (match(i) > 0)
          %line([起点横坐标，终点横坐标],[起点纵坐标，终点纵坐标],...)，
        line([loc(i,2) loc(match(i),2)], [loc(i,1) loc(match(i),1)], 'Color', 'c');
      end
    end
    %求匹配特征点个数
    num = sum(match > 0);
    %输出num
    fprintf('Finding %d matches.\n', num);
    
    