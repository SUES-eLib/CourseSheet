function watermark_c(str,w)
%实验要求：'The meeting will be held at 9 o''clock';
%s=size（A）%返回一个行向量s，s的第一个元素是矩阵的行数，第二个元素是矩阵的列数
%如果在size函数的输入参数中再添加一项n，并用1或2为n赋值，则 size将返回矩阵的行数或列数。
%其中r=size(A,1)该语句返回的是矩阵A的行数， c=size(A,2) 该语句返回的是矩阵A的列数
b = dec2bin(w);
%为了使二进制水印的长度与文本列向量的长度相同，这里format是'%08s',其中8是位数,0代表不足8位的用0补齐
format = ['%0' num2str(size(str, 2)) 's'];
%将二进制数b的长度转化成format的'%0?s'?对应的长度(不改变数的大小，前面补0)
a_bin = sprintf(format, b);
fprintf('嵌入后的文本为：')
for i=1:size(str, 2)
    if a_bin(1,i) == '0'%遍历找0，注意第一个索引参数要为1
        cprintf('Black',str(1,i));
    else
        cprintf('-Red',str(1,i));
    end
end
end

