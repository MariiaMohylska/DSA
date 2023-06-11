import 'linkedlist.dart';

void main() {
  //Merge Sorting using array
  var array = [10, 7, 2, 12, 55, 24, 200];
  print('Initial array: $array');

  var sorted_array = merge_sort_array(array);
  print('Sorted array: $sorted_array');
  print('');
  // Merge Sorting using linkedList
  var linkedList = LinkedList();
  
  linkedList.add(10);
  linkedList.add(2);
  linkedList.add(44);
  linkedList.add(15);
  linkedList.add(32);
  linkedList.add(23);
  linkedList.add(200);
  
  print('Initial LinkedList: $linkedList');
  var sorted_linkedList = merge_sort_linkedList(linkedList);
  print('Sorted LinkedList: $sorted_linkedList');
}

List merge_sort_array(List list) {
  /**
   * Sorts a list in ascending order
   * Returns a new sorted list
   * 
   * Diveide: Find the midpoint of the list and divide into sublist
   * Conquer: Recursively sort sublists created in previous step
   * Combine: merge the sorted sublist created in previous step
   * 
   * Takes O(k n log n) time
   **/
  if (list.length <= 1) {
    return list;
  }

  var midpoint = list.length ~/ 2;

  var left_half = list.sublist(0, midpoint);
  var right_half = list.sublist(midpoint);

  var left = merge_sort_array(left_half);
  var right = merge_sort_array(right_half);

  return merge_array(left, right);
}

List merge_array(List left, List right) {
  /**
   * Merges 2 list (arrays), sorting them in the procedd
   * Return a new merged list
   **/
  var l = [];
  var i = 0;
  var j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      l.add(left[i]);
      i += 1;
    } else {
      l.add(right[j]);
      j += 1;
    }
  }

  while (i < left.length) {
    l.add(left[i]);
    i += 1;
  }

  while (j < right.length) {
    l.add(right[j]);
    j += 1;
  }

  return l;
}

bool verify_sorted_array(List list) {
  var n = list.length;

  if (n == 0 || n == 1) {
    return true;
  }

  return list[0] < list[1] && verify_sorted_array(list.sublist(1));
}

merge_sort_linkedList(LinkedList linked_list) {
  /**
   * Sorts a linked list in ascending order
   *  - Recursively  divide the linked list into sublist containing a single node
   *  - Repeatedly merge the sublist to produce sorted sublist until one remains
   * 
   * Returns a sorted list
   * */

  if (linked_list.size() == 1 || linked_list.head == null) {
    return linked_list;
  }

  var left_half;
  late var right_half;

  if (linked_list == null || linked_list.head == null) {
    left_half = linked_list;
  } else {
    var midpoint = linked_list.size() ~/ 2;
    var mid_node = linked_list.node_at_index(midpoint - 1)!;
    
    left_half = linked_list;
    right_half = LinkedList();
    
    right_half.head = mid_node.next_node;
    mid_node.next_node = null;
  }

  var left = merge_sort_linkedList(left_half);
  var right = merge_sort_linkedList(right_half);
  
  return merge_linkedList(left, right);
}

LinkedList merge_linkedList(left, right) {
  //Create a new linked list that contains nodes from merging left and right
  var merged = LinkedList();
  
  //Add a fake head that is discatded later
  merged.add(0);
  
  // Set current to the head of the linked list
  var current = merged.head;
  
  //Obtain head nodes for left and right linked list
  var left_head = left.head;
 	var right_head = right.head;

  while (left_head != null || right_head != null) {
    if(left_head == null) {
      current.next_node = right_head;
      // Call next on right to set loop condition to False
     	right_head = right_head.next_node;
    }else if(right_head == null) {
      current.next_node = left_head;
      //Call next on  left to set loop condition to False
      left_head = left_head.next_node;
    } else {
      var left_data = left_head.data;
      var right_data = right_head.data;
      
      if(left_data < right_data) {
        current.next_node = left_head;
        left_head = left_head.next_node;
      } else {
        current.next_node = right_head;
        right_head = right_head.next_node;
      }
    }
    
    current = current.next_node;
  }
  
  var head = merged.head.next_node;
  merged.head = head;
  
  return merged;
}





















