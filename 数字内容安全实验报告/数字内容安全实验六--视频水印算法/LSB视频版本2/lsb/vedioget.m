clear all; 
clc;
clf;
start_time=cputime;






%对每个帧进行水印嵌入
    %提取视频中的每一帧



mov=aviread('withed11.avi',1);


      
    %转化帧为YUV图像格式
    mov1=ind2rgb(mov.cdata,mov.colormap);
    movi=uint8(round(mov1*255));
    a=movi;
    


[ste_cover,len_total]=randlsbget(a,50,'secret.txt',213);



