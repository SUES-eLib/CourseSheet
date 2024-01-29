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
void QuickSort(List PtrL, int start, int end)
{
    if (start > end)
        return;
    int tmp = PtrL->Data[start];
    int i = start;
    int j = end;
    while (i != j) {
        while (PtrL->Data[j] >= tmp && j > i)
            j--;
        while (PtrL->Data[i] <= tmp && j > i)
            i++;
        if (j > i) {
            int t = PtrL->Data[i];
            PtrL->Data[i] = PtrL->Data[j];
            PtrL->Data[j] = t;
        }
    }
    PtrL->Data[start] = PtrL->Data[i];
    PtrL->Data[i] = tmp;
    QuickSort(PtrL, start, i - 1);
    QuickSort(PtrL, i + 1, end);
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
    printf("\n��������������:\n");
    QuickSort(SqList, 0, num - 1);
    for(i=0;i<num;i++){
        printf("%d ",SqList->Data[i]);
    }
    return 0;
}