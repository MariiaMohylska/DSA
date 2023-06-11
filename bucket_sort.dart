void main() {
    var array = [0.42, 0.31, 0.58, 0.21, 0.56, 0.7, 0.36];
    print("Initial array:\n $array");

    bucketSortDecimal(array);
    print("Sorted array:\n $array");
}

void bucketSortDecimal(List<double> array){
  var numberOfBucket = 10;
  bucketSort(array, numberOfBucket, (element, bucketNumbers) => (element * bucketNumbers).toInt());
}

void bucketSort(List<double> array, int numberOfBucket, int Function(double, int) indexCointing) {
  List<List<double>> buckets = List.generate(numberOfBucket, (_) => []);

  for(var e in array) {
    var index = indexCointing(e, numberOfBucket);
    buckets.elementAt(index).add(e);
  }

  for(var bucket in buckets) {
    bucket.sort();
  }

  int index = 0;
  for(var bucket in buckets){
    for(var element in bucket){
      array[index] = element;
      index ++;
    }
  }

}