// THIS IS AMAZING

GOL gol;

void setup() {
  size(1080, 640);
  frameRate(24);
  gol = new GOL();
}

void draw() {
  background(#FFFFFF);
  gol.generate();
  gol.display();
}

void mousePressed() {
  gol.init();
}
