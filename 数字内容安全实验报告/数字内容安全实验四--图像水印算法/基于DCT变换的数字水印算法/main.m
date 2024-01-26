clc;
clear;
close;
%%% 作者：PI %%%
global pathfile1;%载体图片地址
global pathfile2;%水印图片地址
global pathfile3;%含水印图片的载体图片地址
global pathfile4;%提取水印图片地址
global pathfile5;%攻击后含水印的载体图片地址
global pathfile6;%置乱的水印图片地址
global pathfre;%前缀
global k1;
k1=randn(1,8);
global k2;
k2=randn(1,8);
test();