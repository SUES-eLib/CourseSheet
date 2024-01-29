#include <cstdio>
#define QueueSize 10
typedef int ElementType;
typedef struct{
    ElementType Data[QueueSize];
    int front;
    int rear;
}SqQueue;
void PrintQueue(SqQueue qu) {
    int i = qu.front;
    printf("Queue:");
    while (i != qu.rear) {
        printf("%d ", qu.Data[i]);
        i = (i + 1) % QueueSize;
    }
    printf("\n");
}
int main(){
    ElementType a,x;
    SqQueue qu;
    qu.rear=qu.front=0;
    printf("Input queue(end with 0, InQueue with positive, DeQueue with negative)\n");
    scanf("%d",&a);
    while(a!=0){
        if(a>0){
            if((qu.rear+1)%QueueSize==qu.front){
                printf("Full Queue!\n");
                PrintQueue(qu);
                return 0;
            }
            qu.Data[qu.rear]=a;
            qu.rear=(qu.rear+1)%QueueSize;
        }else{
            if(qu.rear==qu.front){
                printf("NUll Queue!\n");
                return 0;
            }
            x=qu.Data[qu.front];
            qu.front=(qu.front+1)%QueueSize;
            printf("%dDeQueue\n",x);
        }
        scanf("%d",&a);
    }
    PrintQueue(qu);
    return 0;
}