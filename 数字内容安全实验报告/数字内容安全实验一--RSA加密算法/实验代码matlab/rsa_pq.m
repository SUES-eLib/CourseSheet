%函数用于求RSA算法的p q n Q e d：
%1.随机选定两个互异的大素数p,q
%2.计算公钥和私钥的公共模数n=p*q
%3.计算模数n的欧拉函数Q=(p-1)*(q-1)，选定一个正整数e，使1<e<Q，且e与E互质
%4.求出正数d，使其满足d*e =1（mod Q）,则将(n,d)作为私钥
function [p,q,n,Q,e,d]=rsa_pq()
n1=101;%我随便给的
n2=167;
p=ceil(n1.*rand(1,1));%产生两个随机数
q=ceil(n2.*rand(1,1));%产生两个随机数
n=q*p;  %计算n
Q=(p-1)*(q-1); %欧拉函数fi
%循环用于随机生成一个e
for j=1:1:100
    k=0;
    E=ceil(30*rand); %随机生成E
    if E<Q %判断这个E是否小于Q
    for i=2:1:(Q-1) %i:除了1和Q本身
        if rem(Q,i)==0&&rem(E,i)==0 %如果Q、E不是质数,break
            k=1;
            break;
        end
    end
    if k==0 %Q、E互质
        e=E; 
        break;
    end
    end
end
%循环用于随机生成一个d
for j=1:1:100
      d=ceil(((Q*j)+1)/e); %d*e=j倍的Q加1
        if mod(e*d,Q*j)==1 %如果mod(e*d,Q*j)等于1
            d=ceil(((Q*j)+1)/e);%上述d值可用
            break;
        end   
end
disp('------------RSA算法开始执行------------------------');
disp('正在随机生成p,q,n,Q,e,d');
Y = ['p=',num2str(p),'  ','q=',num2str(q),'  ','n=',num2str(n),'  ','Q=',num2str(Q),'  ','e=',num2str(e),'  ','d=',num2str(d)];
disp(Y)

