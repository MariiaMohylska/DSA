void main() {
  var array = [10, -7, 2, 12, 55, 24, 200];
  print('Initial array: $array');
  var sorted_array = quicksort(array);
  print('Sorted array: $sorted_array');
}

List<int> quicksort(List<int> array) {
  if(array.length <=1) {
    return array;
  }

  final less_than_pivot = <int>[];
  final greater_than_pivot = <int>[];
  final pivot = array[array.length ~/ 2];

  array.remove(pivot);

  for(var element in array) {
    if(element < pivot){
      less_than_pivot.add(element);
    } else {
      greater_than_pivot.add(element);
    }
  }

  return [...quicksort(less_than_pivot), pivot, ...quicksort(greater_than_pivot)];
}