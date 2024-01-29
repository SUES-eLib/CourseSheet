wavin = 'recoder_embed.wav';
[x1,fs1]=audioread(wavin);
fid = fopen(wavin,'r'); 
header = fread(fid,40,'uint8=>char');
dsize  = fread(fid,1,'uint32');
stego  = fread(fid,inf,'uint16');%��Ƶ�ļ�������
fclose(fid);
symax_bit = bitget(stego(1:8),1)';%bitget(y,1)����ȡy�Ķ��������λ
sy_length_bit=bitget(stego(9:32),1)';
symax=0;
for i=1:8
    symax=symax+2^(i-1)*symax_bit(i);
end
symax=symax./100;%��ԭ����
sy_length = 0;
for i=1:24
    sy_length=sy_length+2^(i-1)*sy_length_bit(i);
end

fs_bit=bitget(stego((33+9*sy_length):(48+9*sy_length)),1)';%��ȡ������fs_bit���ԣ�Ϊ1400W��
fs=0;
for i=1:16
    fs=fs+2^(i-1)*fs_bit(i);
end

global sy_data_bit;
global qshuiyin;
sy_data_bit=bitget(stego(33:(32+(9*sy_length))),1)';
for i=1:sy_length
    wei0=sy_data_bit(9*i-8); 
    wei1=sy_data_bit(9*i-7);                  
    wei2=sy_data_bit(9*i-6)*2;                   
    wei3=sy_data_bit(9*i-5)*4;
    wei4=sy_data_bit(9*i-4)*8;
    wei5=sy_data_bit(9*i-3)*16;
    wei6=sy_data_bit(9*i-2)*32;
    wei7=sy_data_bit(9*i-1)*64;
    wei8=sy_data_bit(9*i)*128;
    qshuiyin(i)=wei1+wei2+wei3+wei4+wei5+wei6+wei7+wei8;
    %ƥ��������
    if wei0==0
        qshuiyin(i)=-qshuiyin(i);
    end
end   
lh=255/symax;
Qshuiyin=qshuiyin/lh;
audiowrite('extracting_shuiyin.wav',Qshuiyin,fs);