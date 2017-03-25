
Graph graph;

int textSize = 5;

void setup(){
  size(800,600);
  
  graph = new Graph();
  
  graph.load("movies.json");
  //graph.search("Rachel McAdams","Kevin Bacon");
  
  println(graph.nodes.get(0).pos);
  
  stroke(255);
  noFill();
  //frameRate(1);
  textSize(textSize+10);
  ellipseMode(CORNER);
    //println("x"+graph.nodes.get(0).x+"y"+graph.nodes.get(0).y);
    //println(textWidth(graph.nodes.get(0).value));
}
void mousePressed(){
  graph.mousePressed();
}
void mouseReleased(){
  graph.mouseReleased();
}

void draw(){
  background(51);
  //graph.nodes.get(0).show();
  graph.update();
  //println(graph.nodes.get(0).pos);
  graph.show();
}