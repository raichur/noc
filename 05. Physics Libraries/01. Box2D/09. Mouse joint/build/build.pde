Box2DProcessing box2d;

ArrayList boundaries;

Box box;

Spring spring;

void setup() {
  size(640, 360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  box = new Box(width/2, height/2);
  
  spring = new Spring();
  
  boundaries = new ArrayList();
  boundaries.add(new Boundary(width/2, height-5, width, 10, 0));
  boundaries.add(new Boundary(width/2, 5, width, 10, 0));
  boundaries.add(new Boundary(width-5, height/2, 10, height, 0));
  boundaries.add(new Boundary(5, height/2, 10, height, 0));
  
}

void mouseReleased() {
  spring.destroy();
}

void mousePressed() {
  if(box.contains(mouseX, mouseY)) {
    spring.bind(mouseX, mouseY, box);
  }
}

void draw() {
  background(255);
  box2d.step();
  spring.update(mouseX, mouseY);
  
  for (int i = 0; i < boundaries.size(); i++) {
    Boundary wall = (Boundary) boundaries.get(i);
    wall.display();
  }
  
  box.display();
  spring.display();
}
