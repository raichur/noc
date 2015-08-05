void setup() {
  size(640, 360);
}

void draw() {
  
  background(255);
  
  PVector a = new PVector(20, 300);
  PVector b = new PVector(500, 250);
  PVector mouse = new PVector(mouseX, mouseY);
  
  stroke(0);
  strokeWeight(2);
  line(a.x, a.y, b.x, b.y);
  line(a.x, a.y, mouse.x, mouse.y);
  fill(0);
  ellipse(a.x, a.y, 8, 8);
  ellipse(mouse.x, mouse.y, 8, 8);
  
  PVector normal = scalarProjection(mouse, a, b);
  strokeWeight(1);
  stroke(40);
  line(mouse.x, mouse.y, normal.x, normal.y);
  
  noStroke();
  fill(255, 0, 0);
  ellipse(normal.x, normal.y, 16, 16);

}

PVector scalarProjection(PVector p, PVector b, PVector a) {
 
  PVector ap = PVector.sub(p, a);
  PVector ab = PVector.sub(b, a);
  ab.normalize();
  ab.mult(ap.dot(ab));
  PVector normalPoint = PVector.add(a, ab);
  return normalPoint;
  
}


