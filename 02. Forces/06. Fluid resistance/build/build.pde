// Moving bodies (10)
Mover[] movers = new Mover[10];

Liquid liquid;

void setup() {
  size(660, 360);
  reset();
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);

  // Water!
  liquid.display();

  for(int i = 0; i < movers.length; i++) {

    // Mover in liquid?
    if(liquid.contains(movers[i])) {
      // Drag force Calculate
      PVector dragForce = liquid.drag(movers[i]);
      movers[i].applyForce(dragForce);
    }
  

    PVector gravity = new PVector(0, 0.1*movers[i].mass);
      movers[i].applyForce(gravity);

      // Update and display
      movers[i].update();
      movers[i].display();
      movers[i].checkEdges();
    }
    fill(0);
}

void mousePressed() {
  reset();
}

// Restart
void reset() {
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 3), 40+i * 70, 0);
  }
}
