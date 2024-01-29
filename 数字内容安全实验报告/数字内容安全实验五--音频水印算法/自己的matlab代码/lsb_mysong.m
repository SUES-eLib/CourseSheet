
clc;
clear;
org_voice='recoder.wav';
info = audioinfo(org_voice)
[y,Fs] = audioread(org_voice); %返回样本数据 y 以及该数据的采样率 Fs。
len_key=size(y,1);    %音频的总长度
key=randsrc(len_key,1,[0,1]);%随机生成加密矩阵
y_change=round((y(:,1))*(10^7));%放大（有损）
ymax=max(y_change);    %最大幅度
ymin=min(y_change);    %最小幅度
 for i=1:len_key  %进行LSB嵌入水印
        if y_change(i)>=0 %特征值为正数
            x(i)=bitor(y_change(i),key(i));
        else     %特征值为负数
            x(i)=-bitor(abs(y_change(i)),key(i));
        end  
 end
x=(x.')/(10^7);
t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
figure;
subplot(2,1,1);
plot(t,y);
xlabel('Time');
ylabel('原始音频');
subplot(2,1,2);
plot(t,x);
xlabel('Time');
ylabel('嵌入水印后的音频');



