class Graph{
  ArrayList nodes = new ArrayList();
  HashMap<String,Node> graph = new HashMap<String,Node>();
  Node end = null;
  Node start = null;
  
  void addNode(Node n){
    nodes.add(n);
    graph.put(n.value,n);
  }
  
  Node getNode(String actor){
    return graph.get(actor);
  }
  
  Node setStart(String actor){
    start = graph.get(actor);
    return start;
  }
  Node setEnd(String actor){
    end = graph.get(actor);
    return end;
  }
}