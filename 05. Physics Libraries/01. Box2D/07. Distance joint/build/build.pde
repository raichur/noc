ArrayList<Particle> boxes;

Box2DProcessing box2d;

// Store information about uneven surface
Surface surface;

// List for rects
ArrayList<Pair> pairs;

void setup() {
  size(640, 360);
  
  // Init and create world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // Set custom gravity
  box2d.setGravity(0, -10);
  
  // Create pairs
  pairs = new ArrayList<Pair>();
  
  // Create the arraylist
  boxes = new ArrayList<Particle>();
  
  // Create the surface 
  surface = new Surface();
  
}

void draw() {
  background(255);
  
  // Step through time!
  box2d.step();
  
  // Draw surface
  surface.display();
  
  // Display boxes
  for (Pair p: pairs) {
    p.display();
  }
  
  // Delete when left screen
  for (int i = boxes.size()-1; i >= 0; i--) {
    Particle b = boxes.get(i);
    if(b.done()) {
      boxes.remove(i);
    }
  }
  
}

void mousePressed() {
    Pair p = new Pair(mouseX, mouseY);
    pairs.add(p);
  }
