class Node {
  String value = "";
  ArrayList<Node> edges = new ArrayList<Node>();
  boolean searched = false;
  Node parent = null;

  PVector pos;
  float w;
  float h;
  PVector vel = new PVector(0, 0);
  PVector force = new PVector(0, 0);
  int padding = 20;
  float dfix = 170;
  boolean moused = false;
  float mdx;
  float mdy;

  Node(String value) {
    this.value = value;
    w = textWidth(value) + padding * 2 + 10;
    h = textSize + padding * 2;
    pos = new PVector(random(width - w), random(height - h));
  }

  void addEdge(Node n) {
    edges.add(n);
    n.edges.add(this);
  }
  void mousePressed(){
    println("PP");
    if (mouseX > pos.x && 
      mouseX < pos.x+w && 
      mouseY > pos.y && 
      mouseY < pos.y+h){
        moused = true;
        mdx = mouseX - pos.x;
        mdy = mouseY - pos.y;
    }
  }
  void mouseReleased(){
        moused = false;
  }
  
  void resetForce(){
    force.mult(0);
  }
  
  void applyForce(Node n){
    if (n == this) {
      return;
    }
    PVector sub = PVector.sub(this.pos, n.pos);
    
    float d = dfix - sub.mag();
    if (d > 0){
      d = d * 120;
    }
    if (abs(d) > 1) {
      sub.setMag(0.001 * d);
      force.add(sub);
    }
  }

  void update() {
    if (moused){
      pos.x = mouseX + mdx;
      pos.y = mouseY + mdy;
    } else {
      force.add(PVector.mult(vel,-0.999));
      
      vel.add(force);
      pos.add(vel);
    }
  }

  void show() {
    stroke(255, 255, 255, 50);
    for (int i = 0; i < edges.size(); i++) {
      line(this.pos.x + w/2, 
        this.pos.y + h/2, 
        edges.get(i).pos.x + edges.get(i).w/2, 
        edges.get(i).pos.y + edges.get(i).h/2);
    }
    stroke(255, 255, 255, 255);
    //fill(51);
    ellipse(pos.x, pos.y, w, h);
    //fill(255);
    text(value, pos.x+padding, pos.y+padding+textSize);
  }
}