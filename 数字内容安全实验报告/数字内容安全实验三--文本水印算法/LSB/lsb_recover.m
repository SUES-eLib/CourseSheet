%Name:		Chris Shoemaker
%Course:	EER-280 - Digital Watermarking
%Project: 	Least Significant Bit Substitution 
%           Watermark Recovery

clear all;

% save start time
start_time=cputime;

% read in watermarked image
file_name='lsb_watermarked.bmp';
%file_name='_lena_std_bw.bmp';
watermarked_image=imread(file_name);

% determine size of watermarked image
Mw=size(watermarked_image,1);	%Height
Nw=size(watermarked_image,2);	%Width

% use lsb of watermarked image to recover watermark
for ii = 1:Mw
    for jj = 1:Nw
        watermark(ii,jj)=bitget(watermarked_image(ii,jj),1);
    end
end

% scale the recovered watermark
watermark=2*double(watermark);

% display processing time
elapsed_time=cputime-start_time,

% read in original watermark
%file_name='_copyright_large.bmp';
%orig_watermark=imread(file_name);

% scale and display recovered watermark
figure(2)
imshow(watermark,[])
title('Recovered Watermark')