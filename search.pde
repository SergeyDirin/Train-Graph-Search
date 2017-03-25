JSONObject data;
Graph graph;
ArrayList<Node> q = new ArrayList<Node>();

void setup(){
  graph = new Graph();
  
  data = loadJSONObject("movies.json");
  //println(data);
  JSONArray movies = data.getJSONArray("movies");
  
  for (int i = 0; i < movies.size(); i++){
    JSONObject item = movies.getJSONObject(i);
    String movie = item.getString("title");
    JSONArray cast = item.getJSONArray("cast");
    Node movieNode = new Node(movie);
    graph.addNode(movieNode);
    
    for(int j =0; j < cast.size(); j++){
      String actor = cast.getString(j);
      
      Node actorNode = graph.getNode(actor);
      if(actorNode == null){
        actorNode = new Node(actor);
      }
      
      graph.addNode(actorNode);
      movieNode.addEdge(actorNode);
    }
    
  }
    
  Node start = graph.setStart("Rachel McAdams");
  //Node end = graph.setEnd("Mickey Rourke");
  Node end = graph.setEnd("Kevin Bacon");
  
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