ArrayList<Box> boxes;

Box2DProcessing box2d;

void setup() {
  size(640, 360);
  
  // Init and create world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // Create the arraylist
  boxes = new ArrayList<Box>();
  
}

void draw() {
  background(255);
  
  // Step through time!
  box2d.step();
  
  // On mouseDrag
  Box p = new Box(mouseX, mouseY);
  boxes.add(p);
  
  // Display boxes
  for (Box b: boxes) {
    b.display();
  }
  
}
