class Node{
  String value = "";
  ArrayList edges = new ArrayList();
  boolean searched = false;
  Node parent = null;
  
  Node(String value){
    this.value = value;
  }
  
  void addEdge(Node n){
    edges.add(n);
    n.edges.add(this);
  }
}