#include <iostream>
using namespace std;

typedef char ElemType;
typedef struct node {
    ElemType data;
    struct node* LChild, * RChild;
}BNode,*BTree;

void InitBTree(BTree& BT) {
    BT = NULL;
}

void CreateBTree(BTree& BT) {
    ElemType data;
    cin >> data;
    if (data == '#')
        BT = NULL;
    else {
        BT = (BTree)malloc(sizeof(BNode));
        BT->data = data;
        CreateBTree(BT->LChild);
        CreateBTree(BT->RChild);
    }
}

void PreOrder(BTree p) {
    if (p != NULL) {
        cout << p->data << "\t";
        PreOrder(p->LChild);
        PreOrder(p->RChild);
    }
}

void InOrder(BTree p) {
    if (p != NULL) {
        InOrder(p->LChild);
        cout << p->data << "\t";
        InOrder(p->RChild);
    }
}

void PostOrder(BTree p) {
    if (p != NULL) {
        PostOrder(p->LChild);
        PostOrder(p->RChild);
        cout << p->data << "\t";
    }
}

int main() {
    BTree p;
    InitBTree(p);
    cout << "Input the preorder of the BTree:";
    CreateBTree(p);
    cout << "The preorder of the BTree:\n";
    PreOrder(p);
    cout << endl;
    cout << "The inorder of the BTree:\n";
    InOrder(p);
    cout << endl;
    cout << "The postorder of the BTree:\n";
    PostOrder(p);
    cout << endl;
    return 0;
}
