%����������RSA�㷨��p q n Q e d��
%1.���ѡ����������Ĵ�����p,q
%2.���㹫Կ��˽Կ�Ĺ���ģ��n=p*q
%3.����ģ��n��ŷ������Q=(p-1)*(q-1)��ѡ��һ��������e��ʹ1<e<Q����e��E����
%4.�������d��ʹ������d*e =1��mod Q��,��(n,d)��Ϊ˽Կ
function [p,q,n,Q,e,d]=rsa_pq()
n1=101;%��������
n2=167;
p=ceil(n1.*rand(1,1));%�������������
q=ceil(n2.*rand(1,1));%�������������
n=q*p;  %����n
Q=(p-1)*(q-1); %ŷ������fi
%ѭ�������������һ��e
for j=1:1:100
    k=0;
    E=ceil(30*rand); %�������E
    if E<Q %�ж����E�Ƿ�С��Q
    for i=2:1:(Q-1) %i:����1��Q����
        if rem(Q,i)==0&&rem(E,i)==0 %���Q��E��������,break
            k=1;
            break;
        end
    end
    if k==0 %Q��E����
        e=E; 
        break;
    end
    end
end
%ѭ�������������һ��d
for j=1:1:100
      d=ceil(((Q*j)+1)/e); %d*e=j����Q��1
        if mod(e*d,Q*j)==1 %���mod(e*d,Q*j)����1
            d=ceil(((Q*j)+1)/e);%����dֵ����
            break;
        end   
end
disp('------------RSA�㷨��ʼִ��------------------------');
disp('�����������p,q,n,Q,e,d');
Y = ['p=',num2str(p),'  ','q=',num2str(q),'  ','n=',num2str(n),'  ','Q=',num2str(Q),'  ','e=',num2str(e),'  ','d=',num2str(d)];
disp(Y)

