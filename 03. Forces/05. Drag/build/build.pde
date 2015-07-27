class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 1;
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
  Mover m;

  void setup() {
    size(640, 360);
    m = new Mover();

  }

  void draw() {

    background(255);

    PVector gravity = new PVector(0, 0.3);
    gravity.mult(m.mass);
    m.applyForce(gravity);

    if (mousePressed) {
      // Friction!
      PVector drag = m.velocity.get();
      drag.normalize();
  
      float c = -0.0001;
      float speed = m.velocity.magSq();
      
      drag.mult(c*speed*speed);
      
      m.applyForce(drag);
    }

    m.update();
    m.checkEdges();
    m.display();

  }
