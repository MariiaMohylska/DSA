//Also not good algorithm 
// Complexity = O(n2)
void main() {
  var array = [5, 8, 1, 4, 7];
  print(selection_sort(array));
}

List selection_sort(List array){
  var sorted_list = [];
  var array_length = array.length;

  for(int i = 0; i < array_length; i++){
     var minElement = getMinElement(array);
     sorted_list.add(minElement);
     array.remove(minElement);
  }

  return sorted_list;
}

dynamic getMinElement(List array){
    var minElement = array[0];
    for(int i = 1; i < array.length; i ++){
      if(array[i] < minElement) {
        minElement = array[i];
      }
    }
    return minElement;
} 