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
void ShellSort(List PtrL){
    int i=0,j=0;
    int temp=0;
    int incre=0;
    for(incre=(PtrL->Last+1)/2;incre>0;incre/=2){
        for(i=incre;i<PtrL->Last+1;i++){
            temp=PtrL->Data[i];
            j=i-incre;
            while(j>=0 && temp<PtrL->Data[j]){
                PtrL->Data[j+incre]=PtrL->Data[j];
                j-=incre;
            }
            PtrL->Data[j+incre]=temp;
        }
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
    printf("\nShell����������Ϊ��\n");
    ShellSort(SqList);
    for(i=0;i<num;i++){
        printf("%d ",SqList->Data[i]);
    }
    return 0;
}