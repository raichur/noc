class Repeller {
 
  float r = 30;
  float g = 150;
  PVector location;
  
  Repeller(float x, float y) {
    location = new PVector(x, y);
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(175);
    ellipse(location.x, location.y, 48, 48);
  }
  
  PVector repel(Particle p) {
    PVector dir = PVector.sub(location, p.location);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d, 5, 100);
    float force = -1 * g / (d * d);
    dir.mult(force);
    return dir;
  }
}
