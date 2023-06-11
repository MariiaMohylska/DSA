void main() {
  var array = [10, 7, 2, 12, 55, 24, 200];
  print('Initial array: $array');
 var sorted_array = mergeSort(array);
  print('Sorted array: $sorted_array');
}

List<int> mergeSort(List<int> array) {
  if(array.length <= 1) {
    return array;
  }

  var midpoint = array.length ~/2;

  var left_half = array.sublist(0, midpoint);
  var right_half = array.sublist(midpoint);

  var left = mergeSort(left_half);
  var right = mergeSort(right_half);

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  final sorted_list = <int>[];
  var l = 0;
  var r = 0;
  
  while(r < right.length && l < left.length) {
    if(left[l] < right[r]){
      sorted_list.add(left[l]);
      l++;
    } else {
      sorted_list.add(right[r]);
      r++;
    }
  }

  while(r < right.length){
     sorted_list.add(right[r]);
     r++;
  }

  while(l < left.length){
    sorted_list.add(left[l]);
    l++;
  }

  return sorted_list;
}