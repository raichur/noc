class Particle {
  
  // Reference to a Box2D body
  Body body;
  
  color col;
  
  Particle (float x, float y) {
    makeBody(new Vec2(x, y));
    col = color(100);
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
  
  // Change color
  void change() {
    col = color(255, 255, 0);
  }
  
  // Okay to delete
  boolean done() {
    // Position on screen
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom?
    if(pos.y > height) {
      killBody();
      return true;
    }
    return false;
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
     
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(col);
    stroke(0);
    strokeWeight(2);
    beginShape();
    // Convert vertices to pixel vectors
    for(int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  // Add particle to box2d world
  void makeBody(Vec2 center) {
    Vec2[] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-15, 25));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(15, 0));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(20, -15));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-10, -10));
    
    // Define a polygon
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);
    
    // Define the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    
    // Fixture creation shorthand
    body.createFixture(ps, 1.0);
    
    // Initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}
