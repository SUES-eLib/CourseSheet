clear all; 
clc;
clf;
start_time=cputime;






%��ÿ��֡����ˮӡǶ��
    %��ȡ��Ƶ�е�ÿһ֡



mov=aviread('withed11.avi',1);


      
    %ת��֡ΪYUVͼ���ʽ
    mov1=ind2rgb(mov.cdata,mov.colormap);
    movi=uint8(round(mov1*255));
    a=movi;
    


[ste_cover,len_total]=randlsbget(a,50,'secret.txt',213);



