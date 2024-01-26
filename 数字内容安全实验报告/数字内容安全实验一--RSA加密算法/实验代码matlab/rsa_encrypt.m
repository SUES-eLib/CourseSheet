%RSA加密算法,key1明文-->key2密文
function rsa1=rsa_encrypt(key1,e,n)
length_key=length(key1);
bin_e=dec2bin(e);
length_e=length(bin_e);
for j=1:1:length_key%加密
    x=0;
    c=1;
    for i=1:1:length_e
        x=2*x;
        c=mod(c*c,n);%这部分为自定义设置
        if bin_e(i)=='1'
            x=x+1;
            c=mod(c*key1(j),n);%RSA核心算法
        end
    end
      key2(j)=c; %加mod后c最终的值赋给key2  
end
disp('李家兴的RSA加密算法:');
disp('明文为：');
disp(key1);
disp('密文为：');
disp(key2);
rsa1=key2;


