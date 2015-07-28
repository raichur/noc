// Attractor class
class Attractor {
  float mass;
  PVector location;
  float G;
  boolean dragging = false;
  PVector dragOffset;
  boolean rollover = false;


  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
    G = 1;
    dragOffset = new PVector(0.0,0.0);
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
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);
    if (dragging) fill(50);
    else if (rollover) fill(100);
    else fill(175, 200);
    ellipse(location.x, location.y, mass*2, mass*2);
  }

  // Mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void hover(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < mass) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    if(dragging) {
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
    }
  }

}

// Mover Class
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  float a = 0.0;
  float aVeclocity = 0.0;
  float aAcceleration = 0.001;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  void update() {
    aAcceleration = acceleration.x/10.0;
    a += aVeclocity;
    aVeclocity += aAcceleration;
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
    fill(0, 100);
    pushMatrix();
    translate(location.x, location.y);
    rotate(a);
    rectMode(CENTER);
    rect(0, 0, mass*25, mass*25);
    popMatrix();
  }

}


Mover[] movers = new Mover[10];
Attractor a;

void setup() {
  size(640, 360);
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,2), random(width), random(height));
  }
  a = new Attractor();
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].update();
    movers[i].display();
  }

  a.display();
  a.drag();
  a.hover(mouseX, mouseY);
}

void mousePressed() {
  a.clicked(mouseX, mouseY);
}

void mouseReleased() {
  a.stopDragging();
}
