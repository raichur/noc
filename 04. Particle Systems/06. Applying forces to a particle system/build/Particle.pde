class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float a;
  float aVeclocity;
  float aAcceleration;
  float lifespan;
  
  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    lifespan = 255.0;
    a = 0.0;
    aVeclocity = 0.0;
    aAcceleration = random(0.002, 0.0001);
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
    a += aVeclocity;
    aVeclocity += aAcceleration;
  }
  
  // Is lifespan 0?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(location.x, location.y, 12, 12);
  }
}
