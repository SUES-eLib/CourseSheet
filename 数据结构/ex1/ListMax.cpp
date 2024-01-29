#include <cstdio>
#include <cstdlib>
#define N 1000
typedef int ElementType;
typedef struct LNode{
    ElementType data;
    struct LNode *Next;
}LNode,*LinkList;
void CreateLink(LinkList &h, ElementType a[], int n)
{
	LNode *s, *r; int i;
	h = (LNode *)malloc(sizeof(LNode));
	r = h;
	for (i = 0; i < n; i++)
	{
		s = (LNode *)malloc(sizeof(LNode));
		s->data = a[i];
		r->Next = s;
        r = s;
	}
	r->Next = NULL;
}
int MaxNode(LinkList h){
    int j,k;
    LNode *p,*q;
    if(h->Next==NULL){
        return 0;
    }
    q=h->Next;
    p=q->Next;
    k=1;
    j=2;
    while(p!=NULL){
        if(p->data>q->data){
            q=p;
            k=j;
        }
        p=p->Next;
        j++;
    }
    return k;
}
int Print(LinkList h){
    LNode *q;
    if(h->Next==NULL){
        return 0;
    }
    q=h->Next;
    while(q!=NULL){
        printf("%d ",q->data);
        q=q->Next;
    }
}
int main(){
    LinkList head;
    ElementType a[N];
    int i,k,num,flag=0;
    printf("Enter the size of the list:\n");
    scanf("%d",&num);
    fflush(stdin);
    printf("Input a list of number:\n");
    for(i = 0; i < num; i++){
        scanf("%d",&a[i]);
        for (int j = 0; j < i; ++j) {
            if(a[i]==a[j]){
                flag = 1;
                i--;
                num--;
            }
        }
    }
    if(flag == 1) printf("Anything repeated and deleted\n");
    CreateLink(head,a,num);
    printf("Elements in list:\n");
    Print(head);
    printf("\n");
    printf("The No. of the max element\n");
    k=MaxNode(head);
    printf("%d",k);
    return 0;
}