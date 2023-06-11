void main() {
  var l1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
  ListNode? list = ListNode.reverseList(l1);
  
  while(list != null) {
		print("${list.val} ->");
    list = list.next;
  }
  
}
  class ListNode {
    int val;
    ListNode? next;
    ListNode([this.val = 0, this.next]);

    static ListNode? reverseList(ListNode? head) {
    if(head == null || head.next == null) {
      return head;
    }

    ListNode? restList = reverseList(head.next);
  
    head.next!.next = head;
    head.next = null;
    return restList;
  }
 }
