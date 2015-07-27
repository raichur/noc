// Mover Class
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // Reset acceleration
    acceleration.mult(0);
  }

  // F = MA
  void applyForce(PVector force) {
    // New vector
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(175, 100);
    ellipse(location.x, location.y, mass*20, mass*20);
  }

  void checkEdges() {
    if (location.y > height) {
      velocity.x *= -0.9;
      location.y = height;
    }
  }

}


