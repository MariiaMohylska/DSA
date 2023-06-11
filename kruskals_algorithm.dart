void main() {
  final edges = [
    Edge(src: 0, dest: 1, weight: 10),
    Edge(src: 0, dest: 2, weight: 6),
    Edge(src: 0, dest: 3, weight: 5),
    Edge(src: 1, dest: 3, weight: 15),
    Edge(src: 2, dest: 3, weight: 4),
  ];

  final graph = Graph(vertices: 4, edges: edges);
  final result = graph.kruskalsMST();

  for (var edge in result) {
    print('${edge.src} --> ${edge.dest} = ${edge.weight}');
  }
}

class Graph {
  int? vertices;
  List<Edge>? edges;

  Graph({this.vertices, this.edges});

  int find(List<int> parents, int x) {
    if (parents[x] == x) return x;
    return find(parents, parents[x]);
  }

  void union(List<int> parents, List<int> rank, int x, int y) {
    int xRoot = find(parents, x);
    int yRoot = find(parents, y);

    if (rank[xRoot] < rank[yRoot]) {
      parents[xRoot] = yRoot;
    } else if (rank[yRoot] < rank[xRoot]) {
      parents[yRoot] = xRoot;
    } else {
      parents[yRoot] = xRoot;
      rank[xRoot] += 1;
    }
  }

  List<Edge> kruskalsMST() {
    List<Edge> result = [];
    List<int> parents = List.generate(vertices!, (i) => i);
    List<int> rank = List.filled(vertices!, 0);

    edges!.sort((a, b) => a.weight!.compareTo(b.weight!));

    int i = 0;
    int e = 0;

    while (e < vertices! - 1) {
      Edge nextEdge = edges![i];
      i++;

      int x = find(parents, nextEdge.src!);
      int y = find(parents, nextEdge.dest!);

      if (x != y) {
        result.add(nextEdge);
        union(parents, rank, x, y);
        e++;
      }
    }

    return result;
  }
}

class Edge {
  int? src;
  int? dest;
  int? weight;

  Edge({this.src, this.dest, this.weight});
}
