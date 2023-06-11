//VERY BAD ALGORITHM

void main(){
  var array = [5, 8, 1, 4, 7];
  print(bogo_sort(array));
}

bool is_sorted(List array) {
  for(int i = 0; i < array.length - 1;  i++){
    if(array[i] > array[i + 1]){
      return false;
    }
  }

  return true;
}

List bogo_sort(List array){
  var attempts = 0;
  while(!is_sorted(array)){
    print(attempts);
    array.shuffle();
    attempts ++;
  }

  return array;
}