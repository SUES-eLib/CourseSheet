wavin='recoder.wav';
wavout='recoder_embed.wav';
%Header of wav = 1:40, Length of wav = 41:43, Data part = 44:end
fid = fopen(wavin,'r');
header = fread(fid,40,'uint8=>char');
dsize  = fread(fid,1,'uint32');
[cover,len_cover] = fread(fid,inf,'uint16');%��ָ���ļ�������������ÿ������16bit����ȡ��cover,����¼cover�ĳ���
fclose(fid);
[sy,fs]=audioread('shuiyin.wav');%ˮӡ
sy=sy(:,1);
symax=max(abs(sy)) ;                        %����������
symin=min(abs(sy)) ;                        %������С����
len2=size(sy);                                %�������Ƶ���ܳ��ȣ�����FFT����Ƶ��
t2=(0:length(sy)-1)/fs;
lhsy=abs(sy)/symax;                          %��һ��,
lhsy=lhsy*255;                                  %����������������Χ0~255
lhsy=fix(lhsy);                                 %������ֵ����ȡ��
%-----------------��ˮӡת��Ϊ��������
for i=1:len2                                   %l2��ˮӡ�ĳ���
    if sy(i)<0                              %���һλ��ʾ����λ
        k=0;
    else k=1;
    end
    fdsy(9*i-8)=k;
    fdsy(9*i-7)=bitand(lhsy(i),1);
    fdsy(9*i-6)=bitand(lhsy(i),2)/2; 
    fdsy(9*i-5)=bitand(lhsy(i),4)/4;
    fdsy(9*i-4)=bitand(lhsy(i),8)/8;
    fdsy(9*i-3)=bitand(lhsy(i),16)/16;
    fdsy(9*i-2)=bitand(lhsy(i),32)/32;
    fdsy(9*i-1)=bitand(lhsy(i),64)/64;               
    fdsy(9*i)=bitand(lhsy(i),128)/128;
end
%------------------ԭʼ����Ƕ��symax
symax1=fix(symax*100);%92 
for i=1:8
    kk(i)=bitand(symax1,2^(i-1))/(2^(i-1));
    %qrh(i)=bitor(xx1(i),kk(i));
end

%---------------------Ƕ��ˮӡ����l2
%lenthl2=dec2base(l2,2,24);%ˮӡ����ת����24λ������
yyy=len2(:,1);

for i=1:24
    kk(i+8)=bitand(yyy,2^(i-1))/(2^(i-1));
    %qrh(8+i)=bitor(xx1(8+i),lenthl2(i));
end
%-------------Ƕ��ˮӡ�źţ��������λ
for i=1:(9*len2)
    kk(i+32)=fdsy(i);    
end
%---------------------Ƕ��ˮӡƵ�ʣ�16λ������
for i=1:16
    kk(i+9*len2+32)=bitand(fs,2^(i-1))/(2^(i-1));
end
len_sy=size(kk,2);%���ؾ������������ˮӡ�Ķ�����λ��
cover(1:len_sy)=bitset(cover(1:len_sy),1,kk(1:len_sy)');
out = fopen(wavout,'w');
fwrite(out,header,'uint8');
fwrite(out,dsize,'uint32');
fwrite(out,cover,'uint16');
fclose(out);
