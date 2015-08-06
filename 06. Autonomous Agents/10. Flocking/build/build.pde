Flock flock;

void setup() {
  size(1080, 720);
  flock = new Flock();
  
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2, height/2);
    flock.addBoid(b);
  }
}

void draw() {
  background(255);
  flock.run();
}

void mouseDragged() {
  flock.addBoid(new Boid(mouseX, mouseY));
}
