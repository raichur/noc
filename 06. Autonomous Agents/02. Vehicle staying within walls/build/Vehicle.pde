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
    velocity = new PVector(2, -2);
    velocity.mult(5);
    location = new PVector(x, y);
    r = 6;
    maxSpeed = 4;
    maxForce = 0.15;
  }
  
  // Steered = desired - velocity
  void boundaries() {
    
    PVector desired = null;
    
    if(location.x < d) {
      desired = new PVector(maxSpeed, velocity.y);
    } else if(location.x > width - d) {
      desired = new PVector(-maxSpeed, velocity.y);
    } else if(location.y < d) {
      desired = new PVector(velocity.x, maxSpeed);
    } else if(location.y > height - d) {
      desired = new PVector(velocity.x, -maxSpeed);
    }
    
    if(desired != null) {
      desired.normalize();
      desired.mult(maxSpeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxForce);
      applyForce(steer);
    }
    
  }
  
  void run() {
    update();
    display();
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
