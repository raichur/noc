class Vehicle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  
  // Define the maximum steering force and the maximum speed of the vehicle
  float maxForce;
  float maxSpeed;
  
  Vehicle (float x, float y) {
    location = new PVector(x, y);
    r = 12;
    maxSpeed = 3;
    maxForce = 0.3;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void separate (ArrayList<Vehicle> vehicles) {
    
    float desiredSeparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    
    // For every particle, check if it is too close to any other particle 
    
    for(Vehicle other: vehicles) {
      float d = PVector.dist(location, other.location);
      //If it is greater than zero and less than desiredSeparation
      if((d > 0) && (d < desiredSeparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++; // Keep track of how many particles
      }
    }
  
    // Decide steering based on how many
    if (count > 0) {
      sum.setMag(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }
  
  void borders() {
    if (location.x < -r) location.x = width + r;
    if (location.y < -r) location.y = height + r;
    if (location.x > width + r) location.x = -r;
    if (location.y > height + r) location.y = -r;
  }
}
