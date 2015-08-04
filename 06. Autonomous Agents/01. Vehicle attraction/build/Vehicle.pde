class Vehicle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  
  // Define the maximum steering force and the maximum speed of the vehicle
  float maxForce;
  float maxSpeed;
  
  Vehicle (float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -2);
    location = new PVector(x, y);
    r = 6;
    maxSpeed = 4;
    maxForce = 0.1;
  }
  
  // Steered = desired - velocity
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.setMag(maxSpeed); // Scale to maxSpeed
    PVector steer = PVector.sub(desired, velocity); // Use formula
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
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
  
}
