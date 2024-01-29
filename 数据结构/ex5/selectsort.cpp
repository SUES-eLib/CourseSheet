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
    printf("���������ݸ�����\n");
    scanf("%d",&num);
    printf("���������ݣ�\n");
    for(i=0;i<num;i++){
        scanf("%d",&data);
        Insert(data,i,SqList);
    }
    printf("����ǰ������Ϊ��\n");
    for(i=0;i<num;i++){
        printf("%d ",SqList->Data[i]);
    }
    printf("\nֱ��ѡ������������:\n");
    StraightSelectionSort(SqList);
    for(i=0;i<num;i++){
        printf("%d ",SqList->Data[i]);
    }
    return 0;
}