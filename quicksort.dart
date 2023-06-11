// Complexity = best: O(n log n) worst: O(n2)
// You can improve complexity using random element of array for pivot instead of first
void main() {
  var array = [5, 8, 1, 4, 7];
  print(quicksort(array));
}

List quicksort(List array){
  if(array.length <= 1){
    return array;
  }

  List less_than_pivot = [];
  List greater_than_pivot = [];
  var pivot = array[0];

  for(var value in array.sublist(1)) {
    if(value.compareTo(pivot) < 0) {
      less_than_pivot.add(value);
    } else {
      greater_than_pivot.add(value);
    }
  }

  return [...quicksort(less_than_pivot), pivot, ...quicksort(greater_than_pivot)];
}