v = VideoReader('ljx_avi.avi');
while hasFrame(v)
    video = readFrame(v);
end
vd = video(:,:,1);%�����һ֡����ˮӡ����
row = size(vd,1);
col = size(vd,2);
key=randsrc(row,col,[0,1]);%������ɼ��ܾ���
result_key=ones(row,col)*nan;
for i=1:row
    for j=1:col
        result_key(i,j)=bitset(vd(i,j),1,key(i,j));%LSB�㷨���Ĳ���
    end
end
video(:,:,1) = result_key;
newframe = im2frame(video);
org_v = VideoWriter('lsb_video.avi');
open(org_v)
v = VideoReader('ljx_avi.avi');
for k = 1:v.Duration-1
    video = read(v,k);
    writeVideo(org_v,video);
end
writeVideo(org_v,newframe);
close(org_v);
    