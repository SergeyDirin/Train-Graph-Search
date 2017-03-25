
Graph graph;

void setup(){
  graph = new Graph();
  
  graph.load("movies.json");
  graph.search("Rachel McAdams","Kevin Bacon");
  
}