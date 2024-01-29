#include <cstdio>
#include <cstdlib>
typedef int ElementType;
typedef struct LNode *List;
struct LNode{
    ElementType Data[20];
    int last;
};

int BinSearch(List L,ElementType X){
    int left;
    int right;
    int mid;
    if(L->last){
        left=0;
        right=L->last;
        while(left<=right){
            mid=(left+right)/2;
            if(X==L->Data[mid]){
                return mid;
            }else if(X>L->Data[mid]){
                left=mid+1;
            }else if(X<L->Data[mid]){
                right=mid-1;
            }
        }
        return -1;
    }
    return -1;
}
List MakeEmpty(){
    List PtrL;
    PtrL=(List)malloc(sizeof(struct LNode));
    PtrL->last=-1;
    return PtrL;
}
void Insert(List PtrL,int length){
    int i;
    ElementType X;
    printf("�������е�Ԫ��\n");
    for(i=0;i<length;i++){
        scanf("%d",&X);
        PtrL->Data[i]=X;
        PtrL->last++;
    }
}
void OrderCheck(List &L, int length)
{
    int i=1;
    while(i<L->last)
    {
        if(L->Data[i-1]>=L->Data[i])
        {
            printf("������\n");
            printf("����");
            Insert(L,length);
            break;
        }
        i++;
    }
}
int main(){
    List PtrL;
    PtrL=MakeEmpty();
    int length;
    printf("�������еĳ���\n");
    scanf("%d",&length);
    Insert(PtrL,length);
    OrderCheck(PtrL,length);
    ElementType target;
    printf("������ҪѰ�ҵ�Ԫ��\n");
    scanf("%d",&target);
    int position;
    position=BinSearch(PtrL,target);
    if(position!=-1){
        printf("��Ԫ���ڵ�%dλ\n",position+1);
    }else{
        printf("û���ҵ�\n");
    }
    return 0;
}
