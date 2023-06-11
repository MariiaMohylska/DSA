void main() {
  final array = [10, 7, -2, 12, 55, 24, 200];
  print("Initial array:\n $array");

  insertionSort(array);
  print("Sorted array(reg):\n $array");
}

void insertionSort(List<int> array) {
  final size = array.length;

  for(int step = 1; step < size; step++){
    final key = array[step];
    var j = step - 1;

    while(j >=0 && key < array[j]) {
      array[j+1] = array[j];
      j--;
    }

    array[j + 1] = key;
  }
}