function watermark_c(str,w)
%ʵ��Ҫ��'The meeting will be held at 9 o''clock';
%s=size��A��%����һ��������s��s�ĵ�һ��Ԫ���Ǿ�����������ڶ���Ԫ���Ǿ��������
%�����size��������������������һ��n������1��2Ϊn��ֵ���� size�����ؾ����������������
%����r=size(A,1)����䷵�ص��Ǿ���A�������� c=size(A,2) ����䷵�ص��Ǿ���A������
b = dec2bin(w);
%Ϊ��ʹ������ˮӡ�ĳ������ı��������ĳ�����ͬ������format��'%08s',����8��λ��,0������8λ����0����
format = ['%0' num2str(size(str, 2)) 's'];
%����������b�ĳ���ת����format��'%0?s'?��Ӧ�ĳ���(���ı����Ĵ�С��ǰ�油0)
a_bin = sprintf(format, b);
fprintf('Ƕ�����ı�Ϊ��')
for i=1:size(str, 2)
    if a_bin(1,i) == '0'%������0��ע���һ����������ҪΪ1
        cprintf('Black',str(1,i));
    else
        cprintf('-Red',str(1,i));
    end
end
end

