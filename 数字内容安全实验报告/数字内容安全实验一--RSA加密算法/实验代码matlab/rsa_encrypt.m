%RSA�����㷨,key1����-->key2����
function rsa1=rsa_encrypt(key1,e,n)
length_key=length(key1);
bin_e=dec2bin(e);
length_e=length(bin_e);
for j=1:1:length_key%����
    x=0;
    c=1;
    for i=1:1:length_e
        x=2*x;
        c=mod(c*c,n);%�ⲿ��Ϊ�Զ�������
        if bin_e(i)=='1'
            x=x+1;
            c=mod(c*key1(j),n);%RSA�����㷨
        end
    end
      key2(j)=c; %��mod��c���յ�ֵ����key2  
end
disp('����˵�RSA�����㷨:');
disp('����Ϊ��');
disp(key1);
disp('����Ϊ��');
disp(key2);
rsa1=key2;


