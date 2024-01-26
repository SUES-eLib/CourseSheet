#include <cstdio>
#include <malloc.h>
typedef int ElemType;
typedef struct node
{
    ElemType data;
    struct node *next;
} StudNode, *StudLink;

void create(StudLink &sl)
{
    int i, n, score;
    StudNode *s, *r;
    sl = (StudNode*)malloc(sizeof(StudNode));
    r = sl;
    printf("Input the number of students:\n");
    scanf("%d", &n);
    fflush(stdin);
    printf("Input scores of students:\n");
    for (i = 0; i < n; i++){
        s = (StudNode*)malloc(sizeof(StudNode));
        scanf("%d", &score);
        s->data = score;
        r->next = s;
        r = s;
    }
    r->next = NULL;
}
int output(StudLink sl)
{
    StudNode *q;
    if (sl->next == NULL) return 0;
    q = sl->next;
    while (q != NULL)
    {
        printf("%d\t", q->data);
        q = q->next;
    }
}
int count(StudLink sl)
{
    int n = 0;
    StudNode *p = sl->next;
    while (p != NULL)
    {
        if (p->data < 60) n++;
        p = p->next;
    }
    return n;
}
int main()
{
    int n;
    StudLink h;
    create(h);
    n = count(h);
    printf("The list of their scores:\n");
    output(h);
    printf("\nThe number of fail students:\n%d", n);
    return 0;
}
