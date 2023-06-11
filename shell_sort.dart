void main() {
  
  final array = [10, 7, -2, 12, 55, 24, 3, 200];
  print("Initial array:\n $array");

  shellSort(array);
  print("Sorted array(reg):\n $array");
}

void shellSort(List<int> array) {
  final size = array.length;

  for(int interval = size ~/ 2; interval > 0; interval ~/= 2){
    for(int i = interval; i < size; i++){
      final temp = array[i];
      int j;

      for(j = i; j >= interval && array[j - interval] > temp; j -= interval) {
        array[j] = array[j - interval];
      }

      array[j] = temp;
    }
  }
}