ParticleSystem ps;
Repeller repeller;

void setup() {
  size(640, 360);
  ps = new ParticleSystem(new PVector(width/2, 50));
  repeller = new Repeller(width/2-20, height/2);
}

void draw() {
  background(255);
  ps.addParticle();
  
  PVector gravity = new PVector(0, 0.05);
  ps.applyForce(gravity);
  
  if (mousePressed) {
    PVector wind = new PVector(0.07, 0);
    ps.applyForce(wind);
  }
  
  ps.applyRepeller(repeller);
  repeller.display();
  
  ps.run();
  
}
