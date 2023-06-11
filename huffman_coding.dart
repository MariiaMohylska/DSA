void main(List<String> args) {
  var huffmanCoding = HuffmanCoding();
  var originalText = 'hello world';
  var encodedText = huffmanCoding.encode(originalText);
  var decodedText = huffmanCoding.decode(encodedText);

  print(originalText);
  print(encodedText);
  print(decodedText);
}

class HuffmanNode {
  String? symbol;
  int frequency;
  HuffmanNode? left;
  HuffmanNode? right;

  HuffmanNode({this.symbol, required this.frequency, this.left, this.right});

  bool get isLeaf => left == null && right == null;
}

class HuffmanCoding {
  Map<String, int> _frequencyMap = {};
  Map<String, String> _encodedMap = {};

  String encode(String text) {
    String encodedString = '';
    _buildFrequencyMap(text);
    List<HuffmanNode> nodes = _buildNodes();
    HuffmanNode tree = _buildTree(nodes);
    _buildEncodePrefix(tree, '');
      
    for (int i = 0; i < text.length; i++) {
      encodedString += _encodedMap[text[i]] ?? '';
    }

    return encodedString;
  }

  String decode(String encodedText) {
    String decodedString = '';

    HuffmanNode node = _buildTree(_buildNodes());

    for(int i = 0; i < encodedText.length; i++){
      if(encodedText[i] == '0'){
        node = node.left!;
      } else {
        node = node.right!;
      }

      if(node.isLeaf){
        decodedString += node.symbol!;
        node =  _buildTree(_buildNodes());
      }
    }

    return decodedString;
  }

  void _buildFrequencyMap(String text) {
    for (int i = 0; i < text.length; i++) {
      if (_frequencyMap.containsKey(text[i])) {
        _frequencyMap[text[i]] = _frequencyMap[text[i]]! + 1;
      } else {
        _frequencyMap[text[i]] = 1;
      }
    }
  }

  List<HuffmanNode> _buildNodes() {
    List<HuffmanNode> nodes = [];
    _frequencyMap.forEach((symbol, frequency) {
      nodes.add(HuffmanNode(symbol: symbol, frequency: frequency));
    });
    return nodes;
  }

  HuffmanNode _buildTree(List<HuffmanNode> nodes) {
    while (nodes.length > 1) {
      nodes.sort((a, b) => a.frequency.compareTo(b.frequency));

      var left = nodes.removeAt(0);
      var right = nodes.removeAt(0);
      var parent = HuffmanNode(
          frequency: left.frequency + right.frequency,
          left: left,
          right: right);

      nodes.add(parent);
    }

    return nodes.first;
  }

  void _buildEncodePrefix(HuffmanNode node, String prefix){
    if(node.isLeaf){
      _encodedMap[node.symbol!] = prefix;
    } else {
      _buildEncodePrefix(node.left!, prefix + '0');
      _buildEncodePrefix(node.right!, prefix + '1');
    }
  }
}
