#include <iostream>
#define MAXSIZE 20
typedef int ElemType;
typedef struct {
    ElemType data[MAXSIZE];
    int len;
}SqList;
void move(SqList &sq) {
    ElemType t;
    int i=0,j=sq.len-1;
    while(i<=j) {
        while(sq.data[i]%2==1) i++;
        while(sq.data[j]%2==0) j--;
        if(i<j) {
            t=sq.data[i];
            sq.data[i]=sq.data[j];
            sq.data[j]=t;
            i++;
            j--;
        }
    }
}
int main() {
    SqList SqA;
    int num;
    printf("Input the number of SqA:");
    scanf("%d",&num);
    printf("Input the data of SqA:");
    for (int i = 0; i < num; ++i) {
        scanf("%d",&SqA.data[i]);
        for (int j = 0; j < i; ++j) {
            if(SqA.data[i]==SqA.data[j]){
                printf("anything repeated and deleted\n");
                i--;
                num--;
            }
        }
    }
    SqA.len=num;
    move(SqA);
    for (int i = 0; i < num; ++i) {
        printf("%5d",SqA.data[i]);
    }
    return 0;
}
