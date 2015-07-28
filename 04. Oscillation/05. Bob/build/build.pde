PVector origin;
PVector bob;
float len;
float angle = PI/4;

void setup() {
  size(640, 360);

  len = 180;
  origin = new PVector(width/2, 0);
  bob = new PVector(width/2, len);
}

void draw() {
  background(255);

  bob.x = origin.x + len * sin(angle);
  bob.y = origin.y + len * cos(angle);

  line(origin.x, origin.y, bob.x, bob.y);
  ellipse(bob.x, bob.y, 32, 32);
  
  angle += 0.01;
}
