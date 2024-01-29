function  copyMoveDetection(imageName,threshold)
%%����:���ͬһ������ͼ���и���ճ��������
%����:
%  imageName:����ͼ����ļ���(������չ��)������:'CRW_4901_JFRtamp25.jpg'
%  threshold:��ֵ����ΧΪ��(0,1)��Ĭ��Ϊ0.4
%���:
%  �����

%SIFT���㷨
[im, des, loc] = sift(imageName);

%��������������
if nargin<2 
    threshold= 0.4;   %Ĭ����ֵ
end
 match = ones(1,size(des,1));
 %ѭ����ƥ���
    for i = 1 : size(des,1)
        %��������des(i,:) �����des��ÿһ��������ŷ����þ���
        distance_I_other = distanceVectorMatrix(des(i,:),des);
        %����Ľ������С��������
       [vals,indx] = sort(distance_I_other);  
        %��ƥ��������
       if (vals(2) < threshold * vals(3))
          match(i) = indx(2);%���������i��������������������ʹ��������ı�ֵС����ֵthreshold�Ļ���
       else                         %����Ϊ����������������� indx(2)��������iƥ�䡣
          match(i) = 0;         %������ȥ��indx(1)����Ϊ�õ����������i����
       end
    end
    
% ��ʾ���յĵ���ƥ��ͼ.
%ǰ������ʾԭʼ�Ҷ�ͼ��
    figure('Position', [100 100 size(im,2) size(im,1)]);
    colormap('gray');
    imagesc(im);
%��ԭͼ�ϼ�������
    hold on;
    %��������
    for i = 1: size(des,1)
      if (match(i) > 0)
          %line([�������꣬�յ������],[��������꣬�յ�������],...)��
        line([loc(i,2) loc(match(i),2)], [loc(i,1) loc(match(i),1)], 'Color', 'c');
      end
    end
    %��ƥ�����������
    num = sum(match > 0);
    %���num
    fprintf('Finding %d matches.\n', num);
    
    