ArrayList<Particle> Particles;

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
  
  // Turn on collisions
  box2d.listenForCollisions();
  
  // Create the arraylist
  Particles = new ArrayList<Particle>();
  
  // Create the surface 
  surface = new Surface(width/2, height-5, width, 10);
  
}

void draw() {
  background(255);
  
  if(random(1) < 0.1) {
    float sz = random(4, 8);
    Particles.add(new Particle(random(width), 20));
  }
  
  // Step through time!
  box2d.step();
  
  // Draw surface
  surface.display();
  
  // Display Particlees
  for (Particle b: Particles) {
    b.display();
  }
  
  // Delete when left screen
  for (int i = Particles.size()-1; i >= 0; i--) {
    Particle b = Particles.get(i);
    b.display();
    if(b.done()) {
      Particles.remove(i);
    }
  }
  
}

// Collision events
void beginContact(Contact cp) {
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if (o1.getClass() == Particle.class && o2.getClass() == Particle.class) {
    Particle p1 = (Particle) o1;
    p1.change();
    Particle p2 = (Particle) o2;
    p2.change();
  }
}

void endContact(Contact cp) {
  
}
