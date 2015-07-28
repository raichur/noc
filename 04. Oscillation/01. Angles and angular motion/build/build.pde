float a = 0.0;
float aVeclocity = 0.0;
float aAcceleration = 0.001;

void setup() {
  size(640,360);
}

void draw() {
  background(255);

  a += aVeclocity;
  aVeclocity += aAcceleration;

  pushMatrix();
  translate(width/2,height/2);
  rectMode(CENTER);
  stroke(0);
  fill(127);
  rotate(a);
  rect(0,0,64,36);
  popMatrix();
}
