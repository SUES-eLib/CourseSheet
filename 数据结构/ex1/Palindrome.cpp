#include <cstdio>
#include <cstdlib>
#define ElementType char
typedef struct lineStack{
    ElementType data;
    struct lineStack * next;
}lineStack;
lineStack* push(lineStack * stack,char a){
    lineStack * line=(lineStack*)malloc(sizeof(lineStack));
    line->data=a;
    line->next=stack;
    stack=line;
    return stack;
}
int palindrome(ElementType X[]){
    lineStack * stack=NULL;
    int i;
    for(i=0;X[i]!='\0';i++){
        stack=push(stack,X[i]);
    }
    char str;
    lineStack *p;
    for(i=0;X[i]!='\0'&&stack!=NULL;i++){
        p=stack;
        str=p->data;
        stack=stack->next;
        free(p);
        if(X[i]!=str){
            return 0;
        }
    }
    return 1;
}
int main(){
    char ch[20];
    printf("Input a string:\n");
    scanf("%s",&ch);
    int i=palindrome(ch);
    if(i==1){
        printf("%s is palindrome\n",ch);
    }
    else{
        printf("%s is not palindrome\n",ch);
    }
    return 0;
}