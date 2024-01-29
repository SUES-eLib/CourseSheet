%************************************************
%计算峰值信噪比子程序 　　%
%输入：Im_original 原始图像 　　
% Im_modified 修改过的图像 　　
% 输出：S 峰值信噪比 　
%注：此程序用来计算灰度图像的失真程度 　　
% ***********************************************
function S=PSNR(Im_original,Im_modified)
if(size(Im_original)~=size(Im_modified))
    error('错误，两个输入的图像大小不一致');
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
    error('错误，输入图像为彩色图像');
end
end
