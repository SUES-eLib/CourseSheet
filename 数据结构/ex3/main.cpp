#include <cstdio>
#include <cstdlib>

#define MaxVertexNum 100
#define INFINITY 65535
typedef int Vertex;
typedef int WeightType;
typedef char DataType;

typedef struct ENode *PtrToENode;
struct ENode{
    Vertex V1, V2;
    WeightType Weight;
};
typedef PtrToENode Edge;

typedef struct GNode *PtrToGNode;
struct GNode{
    int Nv;
    int Ne;
    WeightType G[MaxVertexNum][MaxVertexNum];
    DataType Data[MaxVertexNum];
};
typedef PtrToGNode MGraph;
MGraph CreateGraph( int VertexNum )
{
    Vertex V, W;
    MGraph Graph;

    Graph = (MGraph)malloc(sizeof(struct GNode));
    Graph->Nv = VertexNum;
    Graph->Ne = 0;
    for (V=0; V<Graph->Nv; V++)
        for (W=0; W<Graph->Nv; W++)
            Graph->G[V][W] = INFINITY;

    return Graph;
}

void InsertEdge( MGraph Graph, Edge E )
{
    Graph->G[E->V1][E->V2] = E->Weight;
    Graph->G[E->V2][E->V1] = E->Weight;
}

MGraph BuildGraph()
{
    MGraph Graph;
    Edge E;
    int Nv, i;
    printf("读入顶点个数：");
    scanf("%d", &Nv);
    Graph = CreateGraph(Nv);
    printf("读入边的个数：");
    scanf("%d", &(Graph->Ne));
    if ( Graph->Ne != 0 ) {
        E = (Edge)malloc(sizeof(struct ENode));
        printf("读入结点信息(起点 终点 权)：\n");
        for (i=0; i<Graph->Ne; i++) {
            scanf("%d %d %d", &E->V1, &E->V2, &E->Weight);
            InsertEdge(Graph, E);
        }
    }

    return Graph;
}

void ShowGraph(MGraph Graph){
    printf("邻接矩阵为:\n");
    int i,j;
    for(i=0;i<Graph->Nv;i++){
        for(j=0;j<Graph->Nv;j++){
            if(Graph->G[i][j]==INFINITY){
                printf("INF\t");
            }else{
                printf("%d\t",Graph->G[i][j]);
            }
        }
        printf("\n");
    }
}

void NodeDegree(MGraph Graph){
    MGraph temp=Graph;
    int i,j;
    int count;
    for(i=0;i<temp->Nv;i++){
        count=0;
        for(j=0;j<temp->Nv;j++){
            if(temp->G[i][j]!=INFINITY){
                count++;
            }
        }
        printf("%d\n",count);
    }

}
int main(){
    MGraph Graph=BuildGraph();
    ShowGraph(Graph);
    printf("\n");
    printf("结点的度为(按编号排列):\n");
    NodeDegree(Graph);
    return 0;
}