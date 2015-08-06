class Vehicle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;
  float maxSpeed;
  
  // Init all values
  Vehicle(float x, float y) {
    location = new PVector(x, y);
    r = 12;
    maxSpeed = 3;
    maxForce = 0.2;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector separateForce = separate(vehicles);
    PVector seekForce = seek(new PVector(mouseX, mouseY));
    separateForce.mult(2);
    seekForce.mult(1);
    applyForce(separateForce);
    applyForce(seekForce);
  }
  
  // steer = desired - velocity
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    return steer;
  }
  
  PVector separate(ArrayList<Vehicle> vehicles) {
    float desiredSeparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    
      for(Vehicle other: vehicles) {
        float d = PVector.dist(location, other.location);
        if((d > 0) && (d < desiredSeparation)) {
           PVector diff = PVector.sub(location, other.location);
           diff.normalize();
           diff.div(d);
           sum.add(diff);
           count++;
         }
      }
   
     if(count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxSpeed);
      sum.sub(velocity);
      sum.limit(maxForce);
     }
     return sum;
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
}
 
    
