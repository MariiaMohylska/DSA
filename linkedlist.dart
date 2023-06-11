void main() {
  var linkedList = LinkedList();

  linkedList.add(1);
  linkedList.add(2);
  linkedList.add(3);
  linkedList.add(5);
  linkedList.add(14);
  print('Initial linkedList: $linkedList');

  linkedList.insert(25, 2);
  print('After inserting [25] at index 2: $linkedList');

  linkedList.insert(43, 9);
  print('After inserting [43] at index 9: $linkedList');

  linkedList.remove_by_key(5);
  print('After deleting [5]: $linkedList');

  linkedList.remove_by_index(4);
  print('After deleting node at index 4 $linkedList');
}

class Node {
  dynamic data = null;
  Node? next_node;

  Node({this.data, this.next_node});

  @override
  String toString() => "<Node data: ${data}>";
}

class LinkedList {
  var head;

  LinkedList({this.head = null});

  bool get isEmpty => head == null;

  int size() {
    var current = head;
    var count = 0;

    while (current != null) {
      count += 1;
      current = current.next_node;
    }

    return count;
  }

  void add(dynamic data) {
    var new_node = Node(data: data);
    new_node.next_node = head;
    head = new_node;
  }

  void append(dynamic data) {
    var new_node = Node(data: data);

    var current = head;

    while (current.next_node != null) {
      current = current.next_node;
    }

    current.next_node = new_node;
  }

  dynamic search(dynamic key) {
    var current = head;

    while (current != null) {
      if (current.data == key) {
        return current;
      } else {
        current = current.next_node;
      }
    }

    return null;
  }

  void insert(dynamic data, int index) {
    if (index >= size()) {
      return append(data);
    }

    if (index == 0) {
      add(data);
    }

    if (index > 0) {
      var new_node = Node(data: data);

      var possition = index;
      var current = head;

      while (possition > 1) {
        current = current.next_node;
        possition -= 1;
      }

      var previous_node = current;
      var next_node = current.next_node;

      new_node.next_node = next_node;
      previous_node.next_node = new_node;
    }
  }

  dynamic remove_by_key(dynamic key) {
    var current = head;
    late var previous;
    bool found = false;

    while (current != null && !found) {
      if (current.data == key && current == head) {
        found = true;
        head = current.next_node;
      } else if (current.data == key) {
        found = true;
        previous.next_node = current.next_node;
      } else {
        previous = current;
        current = current.next_node;
      }
    }

    return current;
  }

  dynamic remove_by_index(int index) {
    if (index >= size()) {
      return null;
    }

    var current = head;

    if (index == 0) {
      head = current.next_node;

      return current;
    }

    late var previous;
    var possition = index;

    while (possition > 0 && current != null) {
      previous = current;
      current = current.next_node;
      possition -= 1;
    }

    previous.next_node = current.next_node;

    return current;
  }

  Node? node_at_index(int index) {
    if (index == 0) {
      return head;
    } else {
      var current = head;
      var position = 0;

      while (position < index) {
        current = current.next_node;
        position += 1;
      }

      return current;
    }
  }

  @override
  String toString() {
    var nodes = [];
    var current = head;

    while (current != null) {
      if (current == head) {
        nodes.add("[Head: ${current.data}]");
      } else if (current.next_node == null) {
        nodes.add("[Tail: ${current.data}]");
      } else {
        nodes.add("[${current.data}]");
      }

      current = current.next_node;
    }

    return nodes.join('->');
  }
}
