%************************************************
%�����ֵ������ӳ��� ����%
%���룺Im_original ԭʼͼ�� ����
% Im_modified �޸Ĺ���ͼ�� ����
% �����S ��ֵ����� ��
%ע���˳�����������Ҷ�ͼ���ʧ��̶� ����
% ***********************************************
function S=PSNR(Im_original,Im_modified)
if(size(Im_original)~=size(Im_modified))
    error('�������������ͼ���С��һ��');
end

if(~isrgb(Im_original)&&~isrgb(Im_modified))
    [m,n]=size(Im_original);
    A=double(Im_original);
    B=double(Im_modified);
    sumaDif=0;
    %maxl=m*n*(max(A(:))^2);
    maxl=m*n*255^2;
    for u=1:m
        for v=1:m
            sumaDif=sumaDif+(A(u,v)-B(u,v))^2;
        end
    end
    if(sumaDif==0)
        sumaDif=1;
    end
    Si=maxl/sumaDif;
    S=10*log10(Si);
else
    error('��������ͼ��Ϊ��ɫͼ��');
end
end
