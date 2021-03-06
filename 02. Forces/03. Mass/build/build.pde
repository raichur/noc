class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(random(width), height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(0.5, 3);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // Reset acceleration
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    // New vector
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void display() {
    stroke(0);
    fill(175, 100);
    ellipse(location.x, location.y, mass*20, mass*20);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }
  }

}


// Declare the Mover object
Mover[] movers;

void setup() {
  size(640, 360);
  movers = new Mover[5];

  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }

}

void draw() {

  background(255);

  for (Mover m : movers) {

    PVector gravity = new PVector(0, 0.3);
    gravity.mult(m.mass);
    m.applyForce(gravity);

    if (mousePressed) {
      PVector wind = new PVector(0.5, 0);
      m.applyForce(wind);
    }

    if(keyPressed) {
      PVector friction = new PVector(-0.01, -0.03);
      m.applyForce(friction);
    }

  m.update();
  m.checkEdges();
  m.display();
  }
}
