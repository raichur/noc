// Notice the inheritance
class Particle extends VerletParticle2D {
  
  float radius = 4;
  
  Particle(float x, float y) {
    super(x, y);
  }

  void display() {
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, radius*2, radius*2);
  }
}
