function result = distanceVectorMatrix(vector,matrix)
%%功能：返回行向量vector 与矩阵matrix中每一行向量的欧几里得距离
%参数说明：
%
%输入：
%   vector：行向量；
%   matrix：矩阵(其列数必须与vector的长度一致)
%输出：
%   result：结果(列向量)

%%主程序
%返回vector的长度
lengthVector = length(vector);

%返回matrix的尺寸
[rowMatrix,colMatrix] = size(matrix);

%检查输入数据是否符合要求
if(lengthVector ~= colMatrix)
    error('函数distance_I_other的输入参数尺寸不正确，请检查后重新输入！');
end

%长度为rowMatrix的列向量
colVec = ones(rowMatrix,1);

%复制变量，求矩阵(colVec*vector-matrix)中每个数的平方
matTemp = (colVec*vector-matrix).^2;

%求矩阵matTemo中每行的和，并开平方后既得最终结果
result = sqrt(sum(matTemp,2));
    
