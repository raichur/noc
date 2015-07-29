class SquareParticle extends Particle {
  
  SquareParticle(PVector l) {
    super(l);
  }
  
  void display() {
    
    fill(127, lifespan);
    stroke(0, lifespan);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(a);
    rect(0, 0, 16, 16);
    popMatrix();
  }
}
