// You have to make a change of an amount using the smallest possible number of coins.
import 'dart:collection';

void main() {
  int amount = 18;
  Set<int> coins = {5, 1, 2};
  final exchangedValues = exchange(amount, coins);
  print(exchangedValues);
}

List<int> exchange(int amount, Set<int> coins) {
  var sum = 0;
  var result = <int>[];
  var sortedCoins = SplayTreeSet<int>.from(coins, (a, b) => b.compareTo(a));

  for(var currentCoin in sortedCoins){
    while(amount >= sum + currentCoin) {
    sum += currentCoin;
    result.add(currentCoin);
  }
  }

  return result;
}