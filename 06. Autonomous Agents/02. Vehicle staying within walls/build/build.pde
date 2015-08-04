Vehicle v;
float d = 25;
boolean debug = true;

void setup() {
  size(640, 360);
  v = new Vehicle(width/2, height/2);
}

void draw() {
  background(255);
  
  if(debug) {
    stroke(175);
    noFill();
    rectMode(CENTER);
    rect(width/2, height/2, width-d*2, height-d*2);
  }
  
  // Call steering behaviors
  v.boundaries();
  v.run();
}

void mousePressed() {
  debug = !debug;
}
