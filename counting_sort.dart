void main() {
  var array = [10, 7, 2, 12, 15, 24, 20];
  print('Initial array: $array');

  print('Sorted array: ${countingSort(array)}');

  var arrayWithNegatives = [-10, 7, 2, 12, -15, 24, 20];

  print('Initial array: $arrayWithNegatives');

  print('Sorted array: ${countingSortWithNegative(arrayWithNegatives)}');
}

List<int> countingSort(List<int> array) {
  var maxInArray = array[0];
  for (var element in array) if (element > maxInArray) maxInArray = element;

  var counter = List<int>.filled(maxInArray + 1, 0);
  var output = List<int>.filled(array.length, 0);

  // count enterence of elements in array
  for (var i in array) counter[i]++;

  for (int i = 1; i < counter.length; i++) counter[i] += counter[i - 1];

  for (var element in array) {
    output[counter[element] - 1] = element;
    counter[element]--;
  }

  return output;
}

List<int> countingSortWithNegative(List<int> array) {
  var maxInArray = array[0];
  var negativeArray = <int>[];

  for (var i in array) {
    if (i > maxInArray) maxInArray = i;
    if (i < 0) {
      negativeArray.add(i);
    }
  }

  if (negativeArray.isNotEmpty) {
    negativeArray = negativeArray.map((e) {
      array.remove(e);
      return e *= -1;
    }).toList();

    negativeArray = countingSortWithNegative(negativeArray)
        .reversed
        .map((e) => e *= -1)
        .toList();
  }

  var counter = List<int>.filled(maxInArray + 1, 0);
  var output = List<int>.filled(array.length, 0);

  // count enterence of elements in array
  for (var i in array) counter[i]++;

  for (int i = 1; i < counter.length; i++) counter[i] += counter[i - 1];

  for (var element in array) {
    output[counter[element] - 1] = element;
    counter[element]--;
  }

  return [...negativeArray, ...output];
}
