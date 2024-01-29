#include<stdio.h>
#include<stdlib.h>

typedef struct node{
    char data ;
    struct node * lchild;
    struct node * rchild;
}BiTree;

BiTree * CreatTree(){
    BiTree *t;
    char ch ;
    ch = getchar();
    if (ch != '#'){
        t = (BiTree *)malloc(sizeof(BiTree));
        t ->data = ch ;
        t->lchild = CreatTree();
        t->rchild = CreatTree();
    }
    else{
        t=NULL;
    }
    return t;
}

int Count(BiTree * top){
    if(top == NULL){
        return 0;
    }
    else if ((top->lchild==NULL) && (top->rchild==NULL)){
        return 1;
    }
    else{
        return Count(top->lchild)+Count(top->rchild);
    }
}

void Preorder(BiTree * top ){
    if(top != NULL){
        printf("%c ",top->data);
        Preorder(top->lchild);
        Preorder(top->rchild);
    }
}

int main(){
    BiTree * top = NULL;
    printf("���ȸ�������������");
    top = CreatTree();
    printf("�ȸ����������");
    Preorder(top);
    putchar('\n');
    printf("Ҷ�ӽڵ�ĸ����� %d\n",Count(top));
    return 0;
}