#include <cstdio>
#define MAXSIZE 100
typedef int ElemType;
typedef struct
{
    ElemType data[MAXSIZE];
    int Len;
}SqList;
void InitList(SqList &sq)
{
    sq={0};
    sq.Len=0;
}
void CreateList(SqList &sq, int n)
{
    ElemType x;
    for (int i = 0; i < n; i++) {
        scanf("%d", &x);
        sq.data[i] = x;
        sq.Len++;
    }
    fflush(stdin);
}
void merge(SqList sqA,SqList sqB,SqList &sqC)
{
    int i=0,j=0,k=0,flag=0;
    while(i<sqA.Len&&j<sqB.Len)
    {
        if(sqA.data[i]<sqB.data[j])
        {
            sqC.data[k]=sqA.data[i];
            i++;
        }
        else if(sqA.data[i]>sqB.data[j])
        {
            sqC.data[k]=sqB.data[j];
            j++;
        }
        else
        {
            sqC.data[k]=sqA.data[i];
            i++;
            j++;
            flag=1;
        }
        k++;
        sqC.Len++;
    }
    while(i<sqA.Len)
    {
        sqC.data[k]=sqA.data[i];
        i++;
        k++;
        sqC.Len++;
    }
    while(j<sqB.Len)
    {
        sqC.data[k]=sqB.data[j];
        j++;
        k++;
        sqC.Len++;
    }
    if(flag==1)
    {
        printf("Deleted the repeated element\n");
    }
}
void OrderCheck(SqList &sq)
{
    int i=1,j=sq.Len;
    while(i<sq.Len)
    {
        if(sq.data[i-1]>=sq.data[i])
        {
            printf("Not in ascending order\n");
            InitList(sq);
            printf("Enter the elements again:");
            CreateList(sq,j);
            break;
        }
        i++;
    }
}
int main() {
    SqList sqA,sqB,sqC;
    int len;
    InitList(sqA);
    InitList(sqB);
    InitList(sqC);
    printf("Enter the size of the table A:");
    scanf("%d",&len);
    fflush(stdin);
    printf("Enter the elements of the table A:");
    CreateList(sqA,len);
    OrderCheck(sqA);
    printf("Enter the size of the table B:");
    scanf("%d",&len);
    fflush(stdin);
    printf("Enter the elements of the table B:");
    CreateList(sqB,len);
    OrderCheck(sqB);
    merge(sqA,sqB,sqC);
    for (int i = 0; i < sqC.Len; ++i)
    {
        printf("%5d",sqC.data[i]);
    }
    return 0;
}
