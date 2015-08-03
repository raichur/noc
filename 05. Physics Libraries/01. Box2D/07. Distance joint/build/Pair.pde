class Pair {
  
  Particle p1;
  Particle p2;
  
  float len;
  
  Pair (float x, float y) {
    len = 32;
    
    // 1. Define two bodies
    p1 = new Particle(x, y);
    p2 = new Particle(x+random(-1, 1), y+random(-1, 1));
    
    // 1. Create joint
    DistanceJointDef djd = new DistanceJointDef();
    // Configure properties (connect two bodies)
    djd.bodyA = p1.body;
    djd.bodyB = p2.body;
    
    // 3. Set equilibrium length
    djd.length = box2d.scalarPixelsToWorld(len);
    // Set frequency and damping
    djd.frequencyHz = 3; // 0 - 5
    djd.dampingRatio = 0.1; // 0 - 1
    
    // 4. Make the joint!
    DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
  }
  
  void display() {
    Vec2 pos1 = box2d.getBodyPixelCoord(p1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(p2.body);
    stroke(0);
    strokeWeight(2);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
    
    p1.display();
    p2.display();
  }
  
}
