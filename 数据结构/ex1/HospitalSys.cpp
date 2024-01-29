#include <cstdio>
#include <cstring>
#include "malloc.h"

typedef char ElemType;
typedef  struct  QNode
{
    ElemType data[15];
    struct QNode  *next;
} QNode,*QueuePtr;
typedef  struct{
    QueuePtr  front;
    QueuePtr  rear;
}LinkQueue;
int main()
{
    int choice,flag=1;
    LinkQueue lq;
    QNode *s,*p;
    char name[15];
    lq.front=( QueuePtr)malloc(sizeof(QNode));
    lq.front->next=NULL;
    lq.rear=lq.front;
    while(flag==1)
    {
        printf("1.排队 2.就诊 3.查看排队情况 0.下班\n");
        printf("请选择：");
        scanf("%d",&choice);
        switch(choice)
        {
            case 0:
                if (lq.front!=lq.rear) printf(">>下班了，请排队的患者改天再来就医\n");
                flag=0; break;
            case 1:
                printf("请输入患者姓名：");
                scanf("%s",name);
                s=( QueuePtr)malloc(sizeof(QNode));
                strcpy(s->data,name);
                s->next=NULL;
                lq.rear->next=s; lq.rear=s;
                break;
            case 2:
                if (lq.front==lq.rear)
                    printf(">>没有排队的患者\n");
                else
                {
                    s=lq.front->next;
                    lq.front->next=s->next;
                    if (lq.rear==s) lq.rear=lq.front;
                    printf("%>>s请就诊\n",s->data);
                    free(s);
                }
                break;
            case 3:
                if (lq.front==lq.rear)
                    printf(">>没有排队的患者\n");
                else
                {
                    p=lq.front->next;
                    printf(">>排队的患者：");
                    while(p!=NULL)
                    {
                        printf("%s   ",p->data);
                        p=p->next;
                    }
                    printf("\n");
                }
                break;
        }
    }
    return 0;
}
