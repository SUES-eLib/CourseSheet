%%RSA�㷨����
function my_RSAoutput(key1)
disp('������������ַ������£�');
disp(key1);
length_key1=length(key1);%���ַ�������
key=[];%���ڷ��÷ָ�������
m=1;
j=1;
for i=1:j:length_key1%�ָ����ģ���ֳɵ����ַ�
    key(m)=abs(key1(i));%���ĵ���ĸ����ASCII��ʮ������
      m=m+1;
end
[p,q,n,Q,e,d]=rsa_pq();
rsa1=rsa_encrypt(key,e,n);
end
