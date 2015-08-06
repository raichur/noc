class Boid {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxSpeed;
  float maxForce;
  
  Boid(float x, float y) {
    location = new PVector(x, y);
    r = 6;
    maxSpeed = 3;
    maxForce = 0.05;
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1 ,1), random(-1, 1));
  }
  
  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void flock(ArrayList<Boid> boids) {
    // A flocking system has three forces: Separation, Alignment, and Cohesion
    PVector sep = separate(boids);
    PVector ali = align(boids);
    PVector coh = cohesion(boids);
    
    // Set weights of these forces
    sep.mult(3);
    ali.mult(1.7);
    coh.mult(4.0);
    
    // Apply them forces
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void render() {
    float theta = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
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
    if (location.x < -r) location.x = width + r;
    if (location.y < -r) location.y = height + r;
    if (location.x > width + r) location.x = -r;
    if (location.y > height + r) location.y = -r;
  }
  
  PVector separate(ArrayList<Boid> boids) {
    float desiredSeparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    
    for(Boid other: boids) {
      float d = PVector.dist(location, other.location);
      if((d > 0) && (d < desiredSeparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    
    if(count > 0) {
      steer.div((float)count);
    }
    if(steer.mag() > 0) {
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }
    return steer;
  }
  
  PVector align(ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other: boids) {
      float d = PVector.dist(location, other.location);
      if((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if(count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }
  
  PVector cohesion(ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for(Boid other: boids) {
      float d = PVector.dist(location, other.location);
      if((d > 0) && (d < neighbordist)) {
        sum.add(other.location);
        count++;
      }
    }
    if(count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    return steer;
  }
}
