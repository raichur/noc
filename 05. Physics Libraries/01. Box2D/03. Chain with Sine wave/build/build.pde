ArrayList<Particle> boxes;

Box2DProcessing box2d;

// Store information about uneven surface
Surface surface;

void setup() {
  size(640, 360);
  
  // Init and create world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // Set custom gravity
  box2d.setGravity(0, -10);
  
  // Create the arraylist
  boxes = new ArrayList<Particle>();
  
  // Create the surface 
  surface = new Surface();
  
}

void draw() {
  background(255);
  
  if(mousePressed) {
    float sz = random(4, 8);
    boxes.add(new Particle(mouseX, mouseY, sz));
  }
  
  // Step through time!
  box2d.step();
  
  // Draw surface
  surface.display();
  
  // Display boxes
  for (Particle b: boxes) {
    b.display();
  }
  
  // Delete when left screen
  for (int i = boxes.size()-1; i >= 0; i--) {
    Particle b = boxes.get(i);
    if(b.done()) {
      boxes.remove(i);
    }
  }
  
}
