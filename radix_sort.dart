void main() {
  var array = [10, 7, 2, 19, 5, 24, 20, 99];
  print('Initial array: $array');
  radixSort(array);
  print('Sorted array: $array');

}

void radixSort(List<int> array){
  int max_number = getMax(array);

  for(int place = 1; max_number ~/ place != 0; place *= 10) {
    counter_sort(array, place, max_number);
  }
}

int getMax(List<int> array){
  int max = array[0];
  for(var e in array) {
    if(max < e){
      max = e;
    }
  }

  return max;
}

void counter_sort(List<int> array, int place, int max_number) {
    var output = List<int>.filled(array.length, 0);
    var counter = List<int>.filled(10, 0);

    for(var e in array){
      counter[e ~/ place % 10] ++;
    }

    for(int i = 1; i < counter.length; i++) {
      counter[i] += counter[i-1];
    }

    for(int i = array.length - 1; i >= 0; i--) {
      output[counter[array[i] ~/ place % 10] - 1] = array[i];
      counter[array[i] ~/ place % 10] --;
    }
    print(output);

    for(int i = 0; i < array.length; i++){
      array[i] = output[i];
    }
}
