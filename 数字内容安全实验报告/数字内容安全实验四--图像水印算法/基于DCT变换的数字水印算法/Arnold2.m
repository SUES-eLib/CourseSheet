function [realwater] = Arnold1(waterpath)
C = imread(waterpath);
[h w]=size(C);
%�����븴ԭ�Ĺ�ͬ����
n=10;
a=3;b=5;
N=h;

%��ԭ
D=zeros(h,w);
for i=1:n
    for y=1:h
        for x=1:w            
            xx=mod((a*b+1)*(x-1)-b*(y-1),N)+1; %��������λ��
            yy=mod(-a*(x-1)+(y-1),N)+1  ;  %��������λ��      
            D(xx,yy)=C(x,y);                   
        end
    end
    C=D;
end
realwater = D;
end
