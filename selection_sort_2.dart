void main() {
  final array = [10, 7, -2, 12, 55, 24, 200];
  print("Initial array:\n $array");
  
  selectionSort_v1(array);
  print("Sorted array (just reorginized):\n $array");

  array.shuffle();
  print("Initial array:\n $array");
  print("Sorted array (created new array):\n ${selectionSort_v2(array)}");
}

void selectionSort_v1(List<int> array) {
  final size = array.length;

  for(int step = 0; step < size - 1; step ++) {
    var min_index = step;

      for(int i = step; i < size; i ++) {
        if(array[i] < array[min_index]){
          min_index = i;
        }
      }

      var temp = array[step];
      array[step] = array[min_index];
      array[min_index] = temp;
  }
}

List<int> selectionSort_v2(List<int> array){
  final sorted_list = <int>[];
  final size = array.length;

  for(int i = 0; i < size; i ++) {
    final min = getMinElement(array);
    sorted_list.add(min);
    array.remove(min);
  }

  return sorted_list;
 }

int getMinElement(List<int> array) {
  var min = array[0];
  for(var elemenet in array) {
    if(elemenet < min) {
      min = elemenet;
    }
  }

  return min;
} 