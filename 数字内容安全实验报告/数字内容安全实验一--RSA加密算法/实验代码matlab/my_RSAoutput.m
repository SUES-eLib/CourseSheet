%%RSA算法加密
function my_RSAoutput(key1)
disp('您输入的明文字符串如下：');
disp(key1);
length_key1=length(key1);%求字符串长度
key=[];%用于放置分割后的明文
m=1;
j=1;
for i=1:j:length_key1%分割明文，拆分成单个字符
    key(m)=abs(key1(i));%明文的字母换成ASCII的十进制数
      m=m+1;
end
[p,q,n,Q,e,d]=rsa_pq();
rsa1=rsa_encrypt(key,e,n);
end
