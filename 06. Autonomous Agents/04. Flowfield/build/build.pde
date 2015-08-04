ArrayList<Vehicle> v;
FlowField flowfield;
boolean debug = true;

void setup() {
  size(640, 360);
  v = new ArrayList<Vehicle>();
  flowfield = new FlowField(20);
  for(int i = 0; i < 120; i++) {
    v.add(new Vehicle(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
  }
}

void draw() {
  background(255);
  
  if(debug) {
    flowfield.display();
  }
  
  for(Vehicle vehicle: v) {
    // Call steering behaviors
    vehicle.follow(flowfield);
    vehicle.run();
  }
}

void keyPressed() {
  if(key == ' ') {
    debug = !debug;
  }
}

void mousePressed() {
  flowfield.init();
}
