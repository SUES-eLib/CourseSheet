#include <cstdio>
#include <cstdlib>

#define MaxVertexNum 100
typedef int Vertex;
typedef int WeightType;
typedef char DataType;
int Visited[MaxVertexNum];
typedef struct ENode *PtrToENode;
struct ENode{
    Vertex V1, V2;
    WeightType Weight;
};
typedef PtrToENode Edge;

typedef struct AdjVNode *PtrToAdjVNode;
struct AdjVNode{
    Vertex AdjV;
    WeightType Weight;
    PtrToAdjVNode Next;
};

typedef struct Vnode{
    PtrToAdjVNode FirstEdge;
    DataType Data;
} AdjList[MaxVertexNum];

typedef struct GNode *PtrToGNode;
struct GNode{
    int Nv;
    int Ne;
    AdjList G;
};
typedef PtrToGNode LGraph;

LGraph CreateGraph( int VertexNum )
{
    Vertex V;
    LGraph Graph;

    Graph = (LGraph)malloc( sizeof(struct GNode) );
    Graph->Nv = VertexNum;
    Graph->Ne = 0;
    for (V=0; V<Graph->Nv; V++)
        Graph->G[V].FirstEdge = NULL;

    return Graph;
}

void InsertEdge( LGraph Graph, Edge E )
{
    PtrToAdjVNode NewNode;
    NewNode = (PtrToAdjVNode)malloc(sizeof(struct AdjVNode));
    NewNode->AdjV = E->V2;
    NewNode->Weight = E->Weight;
    NewNode->Next = Graph->G[E->V1].FirstEdge;
    Graph->G[E->V1].FirstEdge = NewNode;
    NewNode = (PtrToAdjVNode)malloc(sizeof(struct AdjVNode));
    NewNode->AdjV = E->V1;
    NewNode->Weight = E->Weight;
    NewNode->Next = Graph->G[E->V2].FirstEdge;
    Graph->G[E->V2].FirstEdge = NewNode;
}

LGraph BuildGraph()
{
    LGraph Graph;
    Edge E;
    int Nv, i;
    printf("读入顶点个数：");
    scanf("%d", &Nv);
    Graph = CreateGraph(Nv);
    printf("读入边数：");
    scanf("%d", &(Graph->Ne));
    if ( Graph->Ne != 0 ) {
        E = (Edge)malloc(sizeof(struct ENode));
        printf("读入边(起点，终点，权重)：\n");
        for (i=0; i<Graph->Ne; i++) {

            scanf("%d %d %d", &E->V1, &E->V2, &E->Weight);
            InsertEdge( Graph, E );
        }
    }
    return Graph;
}
void Visit( Vertex V )
{
    printf("正在访问顶点%d\n", V);
}

void DFS( LGraph Graph, Vertex V, void (*Visit)(Vertex) )
{
    PtrToAdjVNode W;

    Visit( V );
    Visited[V] = true;

    for( W=Graph->G[V].FirstEdge; W; W=W->Next )
        if ( !Visited[W->AdjV] )
            DFS( Graph, W->AdjV, Visit );
}
int main(){
    LGraph Graph=BuildGraph();
    DFS(Graph,1,Visit);
    return 0;
}