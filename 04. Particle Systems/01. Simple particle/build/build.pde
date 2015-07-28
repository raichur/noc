Particle particle;

void setup() {
  size(640, 360);
  particle = new Particle(new PVector(width/2, 20));
}

void draw() {
  background(255);
  particle.update();
  particle.display();
  
  // Demo: for particle removal
  if(particle.isDead()){
    background(255,0,0);
  }
  
}
