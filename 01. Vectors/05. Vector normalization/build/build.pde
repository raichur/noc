void setup() {
  size(640,360);
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);

  mouse.sub(center);
  // To normalize a vector is to leave its direction as is
  // but make its magnitude 1 unit
  mouse.normalize();
  mouse.mult(50);

  // The two lines above can be simplified to:
  // mouse.setMag(50);

  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
}
