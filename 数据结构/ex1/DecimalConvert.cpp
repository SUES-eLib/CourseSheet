#include <cstdio>
#define MaxSize 100
typedef char ElemType;
typedef struct{
    ElemType data[MaxSize];
    int top;
} SqStack;
int trans(int num,int sys,char string[]){
    SqStack str;
    char ch;
    int r,i=0;
    str.top=-1;
    if(num<=-1){
        printf("Negative number! ");
        return 0;
    }
    while(num!=0){
        r=num%sys;
        ch=r+(r<10?'0':'A'-10);
        str.top++;
        str.data[str.top]=ch;
        num/=sys;
    }
    while(str.top!=-1){
        string[i++]=str.data[str.top];
        str.top--;
    }
    string[i]='\0';
    return 1;
}
int main(){
    char str[10];
    int num,t;
    printf("Input the number and non-negative:");
    scanf("%d",&num);
    t=trans(num,8,str);
    if(t==0){
        printf("ERROR\n");
    }else{
        printf("OCT:%s\n",str);
    }
    t=trans(num,16,str);
    if(t==0){
        printf("ERROR\n");
    }
    else{
        printf("HEX:%s\n",str);
    }
    return 0;
}
