class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  void applyForce(PVector f) {
    // Accumulate forces
    acceleration.add(f);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
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
Mover m;

void setup() {
  size(640, 360);
  m = new Mover();
}

void draw() {

  background(255);

  PVector gravity = new PVector(0, 0.03);
  m.applyForce(gravity);

  PVector wind = new PVector(0.05, 0);
  m.applyForce(wind);

  m.update();
  m.checkEdges();
  m.display();

}
