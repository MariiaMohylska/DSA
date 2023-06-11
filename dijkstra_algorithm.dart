import 'package:collection/collection.dart';

void main(List<String> args) {
  Graph graph = Graph(6);
  graph.adjacencyMatrix = [
    [0, 4, 4, 0, 0, 0],
    [4, 0, 2, 0, 0, 0],
    [4, 2, 0, 3, 1, 6],
    [0, 0, 3, 0, 0, 2],
    [0, 0, 1, 0, 0, 3],
    [0, 0, 6, 2, 3, 0]
  ];
  graph.dijkstra(0, 5);
}

class Graph {
  int vertices;
  List<List<int>> adjacencyMatrix;

  Graph(this.vertices)
      : adjacencyMatrix = List.filled(vertices, List.filled(vertices, 0));

  // Algoritm is implemented with PriorityQueue from collection package
  void dijkstra(int source, int sink) {
    List<bool> visited = List.filled(vertices, false);
    List<int> distance = List.filled(vertices, double.maxFinite.toInt());
    List<int> parent = List.filled(vertices, -1);
    PriorityQueue queue =
        PriorityQueue(((p0, p1) => distance[p0].compareTo(distance[p1])));

    distance[source] = 0;
    queue.add(source);

    while (queue.isNotEmpty) {
      int u = queue.removeFirst();
      visited[u] = true;

      for (int v = 0; v < vertices; v++) {
        if (!visited[v] &&
            adjacencyMatrix[u][v] != 0 &&
            (distance[u] + adjacencyMatrix[u][v]) < distance[v]) {
          parent[v] = u;
          distance[v] = distance[u] + adjacencyMatrix[u][v];
          queue.add(v);
        }
      }
    }

    print('Min path = ${distance[sink]}');

    print('Path:');
    for (int v = sink; v != source; v = parent[v]) {
      print(v);
    }
    print(source);
  }
}
