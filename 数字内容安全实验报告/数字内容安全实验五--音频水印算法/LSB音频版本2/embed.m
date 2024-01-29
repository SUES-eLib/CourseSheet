wavin='recoder.wav';
wavout='recoder_embed.wav';
%Header of wav = 1:40, Length of wav = 41:43, Data part = 44:end
fid = fopen(wavin,'r');
header = fread(fid,40,'uint8=>char');
dsize  = fread(fid,1,'uint32');
[cover,len_cover] = fread(fid,inf,'uint16');%打开指定文件的所有数据且每个数据16bit，读取到cover,并记录cover的长度
fclose(fid);
[sy,fs]=audioread('shuiyin.wav');%水印
sy=sy(:,1);
symax=max(abs(sy)) ;                        %计算最大幅度
symin=min(abs(sy)) ;                        %计算最小幅度
len2=size(sy);                                %计算出音频的总长度，便于FFT分析频谱
t2=(0:length(sy)-1)/fs;
lhsy=abs(sy)/symax;                          %归一化,
lhsy=lhsy*255;                                  %进行量化，量化范围0~255
lhsy=fix(lhsy);                                 %对量化值进行取整
%-----------------将水印转化为二进制码
for i=1:len2                                   %l2是水印的长度
    if sy(i)<0                              %多加一位表示符号位
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
%------------------原始方法嵌入symax
symax1=fix(symax*100);%92 
for i=1:8
    kk(i)=bitand(symax1,2^(i-1))/(2^(i-1));
    %qrh(i)=bitor(xx1(i),kk(i));
end

%---------------------嵌入水印长度l2
%lenthl2=dec2base(l2,2,24);%水印长度转换成24位二进制
yyy=len2(:,1);

for i=1:24
    kk(i+8)=bitand(yyy,2^(i-1))/(2^(i-1));
    %qrh(8+i)=bitor(xx1(8+i),lenthl2(i));
end
%-------------嵌入水印信号，加入符号位
for i=1:(9*len2)
    kk(i+32)=fdsy(i);    
end
%---------------------嵌入水印频率，16位二进制
for i=1:16
    kk(i+9*len2+32)=bitand(fs,2^(i-1))/(2^(i-1));
end
len_sy=size(kk,2);%返回矩阵的列数，即水印的二进制位数
cover(1:len_sy)=bitset(cover(1:len_sy),1,kk(1:len_sy)');
out = fopen(wavout,'w');
fwrite(out,header,'uint8');
fwrite(out,dsize,'uint32');
fwrite(out,cover,'uint16');
fclose(out);
