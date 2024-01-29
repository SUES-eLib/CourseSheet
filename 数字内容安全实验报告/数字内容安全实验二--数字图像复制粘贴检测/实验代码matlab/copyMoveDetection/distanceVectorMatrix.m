function result = distanceVectorMatrix(vector,matrix)
%%���ܣ�����������vector �����matrix��ÿһ��������ŷ����þ���
%����˵����
%
%���룺
%   vector����������
%   matrix������(������������vector�ĳ���һ��)
%�����
%   result�����(������)

%%������
%����vector�ĳ���
lengthVector = length(vector);

%����matrix�ĳߴ�
[rowMatrix,colMatrix] = size(matrix);

%������������Ƿ����Ҫ��
if(lengthVector ~= colMatrix)
    error('����distance_I_other����������ߴ粻��ȷ��������������룡');
end

%����ΪrowMatrix��������
colVec = ones(rowMatrix,1);

%���Ʊ����������(colVec*vector-matrix)��ÿ������ƽ��
matTemp = (colVec*vector-matrix).^2;

%�����matTemo��ÿ�еĺͣ�����ƽ����ȵ����ս��
result = sqrt(sum(matTemp,2));
    
