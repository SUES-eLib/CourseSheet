str = 'Li Jia xing will go home tommorrow';
length = size(str, 2);
a=18;
b = dec2bin(a);
format = ['%0' num2str(length) 's'];
a_bin = sprintf(format, b);
for i=1:length
    if a_bin(1,i) == '0'
        text(0.2+0.05*i, 0.2, str(1,i), 'color','k','FontSize',5);
    else
        text(0.2+0.05*i, 0.2, str(1,i), 'color','r','FontSize',5);
    end
end
