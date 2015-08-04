class Vehicle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  
  // Define the maximum steering force and the maximum speed of the vehicle
  float maxForce;
  float maxSpeed;
  
  Vehicle (PVector l, float ms, float mf) {
    location = l.get();
    r = 3.0;
    maxSpeed = ms;
    maxForce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
  
  public void run() {
    update();
    borders();
    display();
  }
  
  // Reynolds' flow field following algorithm
  void follow(FlowField flow) {
    // What is the vector at that spot in the flow field?
    PVector desired = flow.lookup(location);
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void update() { 
    velocity.add(acceleration);
    // Limit speed to max
    velocity.limit(maxSpeed);
    location.add(velocity);
    // Reset acc after each cycle
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void display() {
    // Triangle in the direction of the velocity
    float theta = velocity.heading2D() + radians(90);
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  
  void borders() {
    if(location.x < -r) location.x = width + r;
    if(location.y < -r) location.y = height + r;
    if(location.x > width + r) location.x = -r;
    if(location.y > height + r) location.y = -r;
  }
  
}
