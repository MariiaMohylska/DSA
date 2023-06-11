void main() {
  var array = [21, 5, -2, 21, 22, 53, 7, 0, -1];
  print("Initial array:\n $array");
  sort(array);
  print("Sorted array:\n $array");
}

void sort(List array) {
    final size = array.length;

    for(int i = (size ~/ 2) - 1; i >=0; i--) {
      heapify(array, size, i);
    }

    for(int i = size - 1; i >= 0; i--) {
      final temp = array[0];
      array[0] = array[i];
      array[i] = temp;

      heapify(array, i, 0);
    }
}

void heapify(List array, int size, int index) {
  var largest = index;
  final left = (2 * index) + 1;
  final right = (2 * index) + 2;

  if(left < size && array[largest] < array[left]) {
    largest = left;
  }

  if(right < size && array[largest] < array[right]) {
    largest = right;
  }

  if(largest != index) {
    final temp = array[index];
    array[index] = array[largest];
    array[largest] = temp;

    heapify(array, size, largest);
  }
}