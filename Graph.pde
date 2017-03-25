class Graph{
  ArrayList nodes = new ArrayList();
  HashMap<String,Node> graph = new HashMap<String,Node>();
  Node end = null;
  Node start = null;
  
  JSONObject data;
  ArrayList<Node> q = new ArrayList<Node>();
  
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
  
  void load(String file){
    data = loadJSONObject(file);
    //println(data);
    JSONArray movies = data.getJSONArray("movies");
    
    for (int i = 0; i < movies.size(); i++){
      JSONObject item = movies.getJSONObject(i);
      String movie = item.getString("title");
      JSONArray cast = item.getJSONArray("cast");
      Node movieNode = new Node(movie);
      this.addNode(movieNode);
      
      for(int j =0; j < cast.size(); j++){
        String actor = cast.getString(j);
        
        Node actorNode = this.getNode(actor);
        if(actorNode == null){
          actorNode = new Node(actor);
        }
        
        this.addNode(actorNode);
        movieNode.addEdge(actorNode);
      }
      
    }
  }
  
  void search(String _start, String _end){
  Node start = this.setStart(_start);
  Node end = this.setEnd(_end);
  
  start.searched = true;
  
  q.add(start);
  while (q.size() > 0){
    Node current = q.get(0);
    //println(current.value);
    q.remove(0);
    if (current == end) {
      println("Found " + current.value);
      break;
    }
    ArrayList<Node> edges = current.edges;
    for (int i = 0; i< edges.size(); i++){
      Node nei =  edges.get(i);
      if (!nei.searched){
        nei.searched = true;
        nei.parent = current;
        q.add(nei);
      }
    }
  }
  
  ArrayList<Node> path = new ArrayList<Node>();
  path.add(end);
  Node next = end.parent;
  while (next != null) {
    println(next.value);
    path.add(next);
    next = next.parent;
  }
  }
}