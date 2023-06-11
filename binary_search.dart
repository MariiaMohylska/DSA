void main() {
  var array = [1, 7, 29, 36, 2, 12, 25, 33, 4, 8];
  print('Array:\n $array');
  array.sort();
  print('Sorted array:\n $array');

  print('Index of [7]: ${binarySearchIterative(array, 7)}');
  print('Index of [33]: ${binarySearchRecursive(array, 33, 0, array.length - 1)}');
  var indexOf28 = binarySearchIterative(array, 28);
  print('Index of [28]: ${indexOf28 != -1 ? indexOf28 : 'Sorry, 28 is not in the array'}');
  var indexOf3 = binarySearchRecursive(array, 3, 0, array.length - 1);
  print('Index of [3]: ${indexOf3 != -1 ? indexOf3 : 'Sorry, 3 is not in the array'}');
}

int binarySearchIterative(List<int> array, int x) {
  var first = 0;
  var last = array.length - 1;

  while(first <= last) {
    var midPoint = first + (last - first) ~/ 2;

    if(array[midPoint] == x) {
      return midPoint;
    }

    if(array[midPoint] > x) {
      last = midPoint - 1;
    } else {
      first = midPoint + 1;
    }
  }

  return -1;
}

int binarySearchRecursive(List<int> array, int x, int first, int last) {
  if(last < first){
    return -1;
  }
  var midPoint = first + (last - first) ~/ 2;
  if(array[midPoint] == x) {
    return midPoint;
  }

  if(array[midPoint] > x) {
    return binarySearchRecursive(array, x, first, midPoint - 1);
  }

  return binarySearchRecursive(array, x, midPoint + 1, last);
  
}