class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 5;
  }

  void update() {

    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    mouse.setMag(0.02);
    acceleration = mouse;

    acceleration = PVector.random2D();
    acceleration.mult(random(2));
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity); // The Mover moves
  }

  void display() {
    stroke(0);
    fill(175);
    // The Mover is displayed
    ellipse(location.x, location.y, 16, 16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }

  }

}


// Declare the Mover object
Mover[] movers = new Mover[20];

void setup() {

  size(640, 360);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }

}

void draw() {

  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }

}
