
clc;
clear;
org_voice='recoder.wav';
info = audioinfo(org_voice)
[y,Fs] = audioread(org_voice); %������������ y �Լ������ݵĲ����� Fs��
len_key=size(y,1);    %��Ƶ���ܳ���
key=randsrc(len_key,1,[0,1]);%������ɼ��ܾ���
y_change=round((y(:,1))*(10^7));%�Ŵ�����
ymax=max(y_change);    %������
ymin=min(y_change);    %��С����
 for i=1:len_key  %����LSBǶ��ˮӡ
        if y_change(i)>=0 %����ֵΪ����
            x(i)=bitor(y_change(i),key(i));
        else     %����ֵΪ����
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
ylabel('ԭʼ��Ƶ');
subplot(2,1,2);
plot(t,x);
xlabel('Time');
ylabel('Ƕ��ˮӡ�����Ƶ');



