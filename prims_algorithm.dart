void main(List<String> args) {
  final graph = Graph(5);
  graph.addEdge(src: 0, desc: 1, weight: 2);
  graph.addEdge(src: 0, desc: 3, weight: 6);
  graph.addEdge(src: 1, desc: 2, weight: 3);
  graph.addEdge(src: 1, desc: 4, weight: 5);
  graph.addEdge(src: 1, desc: 3, weight: 8);
  graph.addEdge(src: 2, desc: 4, weight: 7);
  graph.addEdge(src: 3, desc: 4, weight: 9);
  
  final mst = graph.primMST();
  graph.printMST(mst);
}

class Graph {
  int vertices;
  List<List<int?>> adjMatrix;

  Graph(this.vertices) : adjMatrix = List.generate(vertices, (_) => List.filled(vertices,0));

  void addEdge({required int src, required int desc, int? weight}) {
    adjMatrix[src][desc] = weight;
    adjMatrix[desc][src] = weight;
  }

  int minKey(List<int?> key, List<bool> visited) {
    int? min = double.maxFinite.toInt();
    int minIndex = -1;
    for(int i = 0; i < vertices; i++){
      if(visited[i] == false && key[i]! < min!){
        min = key[i];
        minIndex = i;
      }
    }

    return minIndex;
  }

  List<int> primMST(){
    List<bool> visited = List.filled(vertices, false);
    List<int?> key = List.filled(vertices, double.maxFinite.toInt());
    List<int> parent = List.filled(vertices, -1);

    key[0] = 0;

    for(int counter = 0; counter < vertices - 1; counter++){
      final u = minKey(key, visited);
      visited[u] = true;

      for(int v = 0; v < vertices; v++) {
        if(visited[v] == false && adjMatrix[u][v] != 0 && adjMatrix[u][v]! < key[v]!){
          parent[v] = u;
          key[v] = adjMatrix[u][v];
        }
      }
    }

    return parent;
  }

  void printMST(List<int> parent){
    for(int i = 1; i < parent.length; i++){
      print('${parent[i]} ----> $i // ${adjMatrix[i][parent[i]]}');
    }
  }
}

