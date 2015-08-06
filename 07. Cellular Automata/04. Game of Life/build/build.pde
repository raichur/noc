// THIS IS AMAZING

GOL gol;

void setup() {
  size(640, 360);
  frameRate(24);
  gol = new GOL();
}

void draw() {
  background(255);
  gol.generate();
  gol.display();
}

void mousePressed() {
  gol.init();
}
