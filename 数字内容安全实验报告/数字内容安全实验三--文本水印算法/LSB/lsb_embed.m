%Name:		Chris Shoemaker
%Course:	EER-280 - Digital Watermarking
%Project: 	Least Significant Bit Substitution
%           Watermark Embeding

clear all;
clc;
% save start time
start_time=cputime;

% read in the cover object
file_name='lena.bmp';
[cover_object,map]=imread(file_name);

% read in the message image
file_name='key.bmp';
[message,map1]=imread(file_name);
message1=message;

% convert to double for normalization, then back again
message=double(message);
message=fix(message./2);
message=uint8(message);

% determine size of cover object
Mc=size(cover_object,1);	%Height
Nc=size(cover_object,2);	%Width

% determine size of message object
Mm=size(message,1);	        %Height
Nm=size(message,2);	        %Width

% title the message object out to cover object size to generate watermark
for ii = 1:Mc
    for jj = 1:Nc
        watermark(ii,jj)=message(mod(ii,Mm)+1,mod(jj,Nm)+1);
    end
end

% now we set the lsb of cover_object(ii,jj) to the value of watermark(ii,jj)
watermarked_image=cover_object;
for ii = 1:Mc
    for jj = 1:Nc
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),1,watermark(ii,jj));
    end
end

% write the watermarked image out to a file
imwrite(watermarked_image,'lsb_watermarked.bmp','bmp');

% display processing time
elapsed_time=cputime-start_time;

% calculate the PSNR
psnr=PSNR(cover_object,watermarked_image);
disp('PSNR=');
disp(psnr);
% display watermarked image
figure(1)
imshow(watermarked_image,[])
title('Watermarked Image')
figure(2)
imshow(cover_object,[])
title('original  image')
for ii = 1:Mc
    for jj = 1:Nc
        watermark1(ii,jj)=message1(mod(ii,Mm)+1,mod(jj,Nm)+1);
    end
end
%watermark1=watermark1*256;
%message1=message1*256;
figure(3)
imshow(watermark1,[])
title('the watermark embedded')
figure(4)
imshow(message1,[])
title('the original watermark')