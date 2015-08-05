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
    r = 4.0;
    maxSpeed = ms;
    maxForce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(maxSpeed, 0);
  }
  
  void run() {
    update();
    display();
  }
  
  // Reynolds' path following algorithm
  void follow(Path p) {
    
    // 1. Predict future location (50 frames ahead)
    PVector predict = velocity.get();
    predict.normalize();
    predict.mult(50);
    PVector predictLoc = PVector.add(location, predict);
    
    // 2. Get line segment data
    PVector a = p.start;
    PVector b = p.end;
    
    // 3. Get normal point to line
    PVector normalPoint = getNormalPoint(predictLoc, a, b);
    
    // 4. Find target point a little further ahead of normal
    PVector dir = PVector.sub(b, a);
    dir.normalize();
    dir.mult(10);
    PVector target = PVector.add(normalPoint, dir);
    
    // 5. How far are we away from the path?
    float distance = PVector.dist(predictLoc, normalPoint);
    // If greater than path radius, then steer
    if(distance > p.radius) {
      seek(target);
    }
    
    if(debug) {
      
      fill(0);
      stroke(0);
      line(location.x, location.y, predictLoc.x, predictLoc.y);
      ellipse(predictLoc.x, predictLoc.y, 4, 4);
      
      fill(0);
      stroke(0);
      line(predictLoc.x, predictLoc.y, normalPoint.x, normalPoint.y);
      ellipse(normalPoint.x, normalPoint.y, 4, 4);
      stroke(0);
      if(distance > p.radius) fill(255, 0, 0);
      noStroke();
      ellipse(target.x + dir.x, target.y + dir.y, 8, 8);
    }
    
  }
  
  
  // Get the normal point from a point (p) to a line segment (a–b)
  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
    
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    if (desired.mag() == 0) return;
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void display() {
    float theta = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape(PConstants.TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  
  void borders(Path p) {
    if(location.x > p.end.x + r) {
      location.x = p.start.x - r;
      location.y = p.start.y + (location.y - p.end.y);
    }
  }
}
