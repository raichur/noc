// Attractor class
class Attractor {
  float mass;
  PVector location;
  float G;

  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
    G = 0.4;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);

    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void display() {
    stroke(0);
    fill(175, 100);
    ellipse(location.x, location.y, mass*2, mass*2);
  }

}

// Mover Class
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(random(5,10), random(5,10));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(5,10);
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


Mover m;
Attractor a;

void setup() {
  size(640, 360);
  m = new Mover();
  a = new Attractor();
}

void draw() {
  background(255);

  PVector force = a.attract(m);
  m.applyForce(force);

  m.update();
  a.display();
  m.display();
}


