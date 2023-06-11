void main(){
  final array = [10, 7, -2, 12, 55, 24, 200];
  print("Initial array:\n $array");

  bubbleSortASC(array);
  print("Sorted array(reg):\n $array");

  array.shuffle();
  print("Initial array:\n $array");
  optimizedBubbleSortASC(array);
  print("Sorted array(opt):\n $array");
}

void bubbleSortASC(List<int> array){
  for(int i = 0; i < array.length - 1; i++){
    for(int j = 0; j < array.length - i - 1; j++){
      if(array[j] > array[j + 1]){
        var temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
}


void optimizedBubbleSortASC(List<int> array){
  for(int i = 0; i < array.length - 1; i ++){
    bool swapped = false;
    for(int j= 0; j < array.length - i - 1; j ++){
      if(array[j] > array[j + 1]){
         var temp = array[j];
         array[j] = array[j + 1];
         array[j + 1] = temp;
         swapped = true; 
      }
    }

    if(!swapped){
      break;
    }
  }
}