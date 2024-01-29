#include <cstdio>
#include <cstdlib>
typedef int ElementType;
typedef struct BinSearchTreeNode{
    ElementType data;
    struct BinSearchTreeNode *left;
    struct BinSearchTreeNode *right;
}BSTNode,*PNode;
PNode insertBST(ElementType data,PNode root){
    if(root == NULL)
    {
        root = (PNode)malloc(sizeof(BSTNode));
        root->data = data;
        root->left = NULL;
        root->right = NULL;
        printf("%d  ",data);
        return root;
    }
    if(data < root->data)
        root->left = insertBST(data,root->left);
    else if(data > root->data)
        root->right = insertBST(data,root->right);
    return root;
}
void print(PNode root){
    if(root!=NULL){
        print(root->left);
        printf("%d ",root->data);
        print(root->right);
    }
}
int main(){
    ElementType data[8]={16,5,17,29,11,3,15,20};
    int i;
    PNode root=NULL;
    for(i=0;i<8;i++){
        root=insertBST(data[i],root);
    }
    printf("全部入树\n");
    printf("中序序列为:\n");
    print(root);
    printf("\n");
    return 0;
}