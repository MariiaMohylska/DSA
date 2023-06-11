import 'quicksort.dart';

void main() {
  var names = [
    "Brunon",
    "Bryan",
    "Bryce",
    "Bryden",
    "Brydon",
    "Brydon-Craig",
    "Bryn",
    "Brynmor",
    "Bryson",
    "Buddy",
    "Bully",
    "Burak",
    "Burhan",
    "Butali",
    "Butchi",
    "Byron",
    "Cabhan",
    "Caden",
    "Cadan",
    "Cade",
    "Cadon",
    "Cadyn",
    "Caedan",
    "Caedyn",
    "Cael",
    "Caelan",
    "Caelen",
    "Caethan",
    "Cahl",
    "Cahlum",
    "Cai",
    "Caidan",
    "Caiden",
    "Caiden-Paul",
    "Caidyn",
    "Caie",
    "Cailaen",
    "Cailean",
    "Caileb-John",
    "Cailin",
    "Cain",
    "Caine",
    "Cairn",
    "Cal",
    "Calan",
    "Calder",
    "Cale",
    "Calean",
    "Caleb",
    "Calen",
    "Caley",
    "Calib",
    "Calin",
    "Callahan",
    "Callan",
    "Callan-Adam",
    "Calley",
    "Callie",
    "Callin",
    "Callum",
    "Callun",
    "Callyn",
    "Calum",
    "Calum-James",
    "Calvin",
    "Cambell",
    "Camerin",
    "Cameron",
    "Campbel",
    "Campbell",
    "Camron",
    "Caolain",
    "Caolan",
    "Carl",
    "Carlo",
    "Carlos",
    "Carrich",
    "Carrick",
    "Carson",
    "Carter",
    "Carwyn",
    "Casey",
    "Casper",
    "Cassy",
    "Cathal",
    "Cator",
    "Cavan",
    "Cayden",
    "Cayden-Robert",
    "Cayden-Tiamo",
    "Ceejay",
    "Ceilan",
    "Ceiran",
    "Ceirin",
    "Ceiron",
    "Cejay",
    "Celik",
    "Cephas",
    "Cesar",
    "Cesare",
    "Chad",
    "Chaitanya",
    "Chang-Ha",
    "Charles",
    "Charley",
  ];

  names.shuffle();

  var sorting_names = quicksort(names);

  var searching_names = [ "Bully",
    "Burak",
    "Burhan",
    "Butali",
    "Butchi",
    "Byron",
    "Cabhan",
    "Caden",
    "Cadan",
    "Cade",
    "Cadon",
    "Cadyn",];


  for (var n in searching_names) {
    var index = binary_search(sorting_names, n);
    print(index);
  }

}

binary_search(List collection, dynamic target) {
  var first = 0;
  var last = collection.length - 1;

  while( first <= last) {
    var midpoint = (first + last) ~/2;

    if(collection[midpoint] == target) {
      return midpoint;
    } else if(collection[midpoint].compareTo(target) < 0){
      first = midpoint + 1;
    } else {
      last = midpoint - 1;
    }
  }  
}