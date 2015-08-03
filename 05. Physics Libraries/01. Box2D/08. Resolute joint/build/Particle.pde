class Particle {
  
  // Reference to a Box2D body
  Body body;
  
  float r;
  
  Particle (float x, float y, float r_) {
    r = r_;
    makeBody(x, y, r);
    body.setUserData(this);
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
  
  // Okay to delete
  boolean done() {
    // Position on screen
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom?
    if(pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(0, 0, r*2, r*2);
    line(0, 0, r, 0);
    popMatrix();
  }
  
  // Add particle to box2d world
  void makeBody(float x, float y, float r) {
    // Define
    BodyDef bd = new BodyDef();
    // Set position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);
   
    // Make shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 3;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-10f, 10f), random(5f, 10f)));
    body.setAngularVelocity(random(-10, 10));
  }
}
