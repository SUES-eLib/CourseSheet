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
    printf("用先根遍历输入树：");
    top = CreatTree();
    printf("先根遍历结果：");
    Preorder(top);
    putchar('\n');
    printf("叶子节点的个数： %d\n",Count(top));
    return 0;
}