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
        printf("1.�Ŷ� 2.���� 3.�鿴�Ŷ���� 0.�°�\n");
        printf("��ѡ��");
        scanf("%d",&choice);
        switch(choice)
        {
            case 0:
                if (lq.front!=lq.rear) printf(">>�°��ˣ����ŶӵĻ��߸���������ҽ\n");
                flag=0; break;
            case 1:
                printf("�����뻼��������");
                scanf("%s",name);
                s=( QueuePtr)malloc(sizeof(QNode));
                strcpy(s->data,name);
                s->next=NULL;
                lq.rear->next=s; lq.rear=s;
                break;
            case 2:
                if (lq.front==lq.rear)
                    printf(">>û���ŶӵĻ���\n");
                else
                {
                    s=lq.front->next;
                    lq.front->next=s->next;
                    if (lq.rear==s) lq.rear=lq.front;
                    printf("%>>s�����\n",s->data);
                    free(s);
                }
                break;
            case 3:
                if (lq.front==lq.rear)
                    printf(">>û���ŶӵĻ���\n");
                else
                {
                    p=lq.front->next;
                    printf(">>�ŶӵĻ��ߣ�");
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
