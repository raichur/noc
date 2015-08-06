void setup() {
  size(1080, 680);
  background(255);
  cantor(40, 30, 1000);
}

void draw() {
  noLoop();
}

void cantor(float x, float y, float len) {
  
  float h = 60;
  
  if(len >= 1) {
    noStroke();
    fill(0);
    rect(x, y, len, h/3);
    y += h;
    cantor(x, y, len/3);
    cantor(x + len*2/3, y, len/3);
  }
  
}
