// Let's OOP this stuff ヾ(⌐■_■)ノ
class Pendulum {

  PVector location;
  PVector origin;
  float r;
  float angle;
  float aVelocity;
  float aAcceleration;
  float ballRadius;
  float damping;
  boolean dragging = false;

  Pendulum (PVector origin_, float r_) {

    origin = origin_.get();
    location = new PVector();
    r = r_;
    angle = PI/4;

    aVelocity = 0.0;
    aAcceleration = 0.0;
    damping = 0.995;
    ballRadius = 48.0;

  }

  void go() {
    update();
    drag();
    display();
  }

  void update() {
    if (!dragging) {
      float gravity = 0.4;
      aAcceleration = (-1 * gravity / r) * sin(angle);
      aVelocity *= aAcceleration;
      aVelocity *= damping;
      angle += aVelocity;
    }
  }

  void stopDragging() {
    dragging = false;
    aVelocity = 0;
  }

  void display() {
    location.set(r*sin(angle), r*cos(angle), 0);
    location.add(origin);

    stroke(0);
    strokeWeight(2);
    line(origin.x, origin.y, location.x, location.y);
    ellipseMode(CENTER);
    fill(175);
    if(dragging) fill(0);
    ellipse(location.x, location.y, ballRadius, ballRadius);
  }

  void clicked(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < ballRadius) {
      dragging = true;
    }
  }

  void drag() {
    if (dragging) {
      PVector diff = PVector.sub(origin, new PVector(mouseX, mouseY));
      angle = atan2(-1*diff.y, diff.x) - radians(90);
    }
  }
}

Pendulum p;

void setup() {
  size(640, 360);
  p = new Pendulum(new PVector(width/2,0),175);
}

void draw() {
  background(255);
  p.go();
}

void mousePressed() {
  p.clicked(mouseX, mouseY);
}

void mouseReleased() {
  p.stopDragging();
}
