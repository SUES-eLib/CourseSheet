function [ after_attack ] = attack(choice ,pathfile3)

watermark = imread(pathfile3);
switch choice
%Ö±½ÓÌáÈ¡
case 1
after_attack = watermark;

%ÔëÉù¹¥»÷
case 2
result=watermark;
noise=10*randn(size(result));
result=double(result)+noise;
after_attack=uint8(result);

%¼ôÇĞ¹¥»÷
case 3
result=watermark;
A=result(:,:,1);
B=result(:,:,2);
C=result(:,:,3);
A(1:64,1:400)=512;
B(1:64,1:400)=512;
C(1:64,1:400)=512; 
after_attack=cat(3,A,B,C);

%Ñ¹Ëõ¹¥»÷
case 4
[cA1,cH1,cV1,cD1]=dwt2(watermark,'Haar');
cA1=HYASUO(cA1);
cH1=HYASUO(cH1);
cV1=HYASUO(cV1);
cD1=HYASUO(cD1);
result=idwt2(cA1,cH1,cV1,cD1,'Haar');
after_attack=uint8(result);

%Ğı×ª¹¥»÷
case 5
result=watermark;
after_attack=imrotate(watermark,10,'bilinear','crop');

end

end

