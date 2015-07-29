class SquareParticle extends Particle {
  
  SquareParticle(PVector l) {
    super(l);
  }
  
  void display() {
    fill(127);
    stroke(0);
    rectMode(CENTER);
    rect(location.x, location.y, 16, 16);
  }
}
