#include <cstdio>
#include <cstdlib>
typedef int ElementType;
typedef struct LNode *List;
struct LNode{
    ElementType Data[20];
    int Last;
};
List Creat(){
    List PtrL;
    PtrL = (List)malloc(sizeof(struct LNode));
    PtrL->Last = -1;
    return PtrL;
}
void Insert(ElementType X,int i,List PtrL){
    PtrL->Data[i]=X;
    PtrL->Last++;
}
void StraightSelectionSort(List PtrL){
    int i=0,j=0;
    int temp=0;
    int index;
    for(i=0;i<PtrL->Last;i++){
        index=i;
        for(j=i+1;j<PtrL->Last+1;j++){
            if(PtrL->Data[index]>PtrL->Data[j]){
                index=j;
            }
        }
        temp=PtrL->Data[i];
        PtrL->Data[i]=PtrL->Data[index];
        PtrL->Data[index]=temp;
    }
}
int main(){
    List SqList=Creat();
    int i, data=0, num;
    printf("序列中数据个数：\n");
    scanf("%d",&num);
    printf("请输入数据：\n");
    for(i=0;i<num;i++){
        scanf("%d",&data);
        Insert(data,i,SqList);
    }
    printf("排序前的序列为：\n");
    for(i=0;i<num;i++){
        printf("%d ",SqList->Data[i]);
    }
    printf("\n直接选择排序后的序列:\n");
    StraightSelectionSort(SqList);
    for(i=0;i<num;i++){
        printf("%d ",SqList->Data[i]);
    }
    return 0;
}