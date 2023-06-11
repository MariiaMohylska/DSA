import 'dart:collection';

import 'dart:math';

void main() {
  var graph = Graph(6); 
  
  graph.adjacencyMatrix = [
    [0, 8, 0, 0, 3, 0],
    [0, 0, 9, 0, 0, 0],
    [0, 0, 0, 0, 7, 2],
    [0, 0, 0, 0, 0, 5],
    [0, 0, 7, 4, 0, 0],
    [0, 0, 0, 0, 0, 0],
  ];

  print('Max flow: ${graph.fordFulkerson(source: 0, sink: 5)}');
}

class Graph {
  int vertices;
  List<List<int>> adjacencyMatrix;

  Graph(this.vertices)
      : adjacencyMatrix =
            List.generate(vertices, (_) => List.filled(vertices, 0));

  bool bfs(List<List<int>> rGraph, int source, int? sink, List<int> parent) {
    bool visitedSink = false;
    Queue<int> queue = Queue();
    List<bool> visited = List.filled(vertices, false);
    queue.add(source);
    visited[source] = true;
    parent[source] = -1;

    while (queue.isNotEmpty) {
      int u = queue.removeFirst();

      for (int v = 0; v < vertices; v++) {
        if (!visited[v] && rGraph[u][v] > 0) {
          queue.add(v);
          visited[v] = true;
          parent[v] = u;

          if (v == sink) {
            visitedSink = true;
            break;
          }
        }
      }
    }

    return visitedSink;
  }

  int fordFulkerson({required int source, int? sink}) {
    // Copy adjacencyMatrix to rGraph, because rGraph is going to change values
    List<List<int>> rGraph = List.generate(
        vertices, (u) => List.generate(vertices, (v) => adjacencyMatrix[u][v]));

    // List for containing parent node in augmenting path (is changed in bfs method)
    List<int> parent = List.filled(vertices, -1);
    int maxFlow = 0;

    // while(is available augmenting path with free capacity)
    while(bfs(rGraph, source, sink, parent)){
      int pathFlow = double.maxFinite.toInt();

      // finding min path capacity in path
      for(int? v = sink; v != source; v = parent[v]){
        int u = parent[v!];
        pathFlow = min(pathFlow, rGraph[u][v]);
      }

      // remove occupied capacity in edge and add same value for reverse path
      for(int? v = sink; v != source; v = parent[v]) {
        int u = parent[v!];
        rGraph[u][v] -= pathFlow;
        rGraph[v][u] += pathFlow;
      }

      maxFlow += pathFlow;
    }
  
    return maxFlow;
  }
}
