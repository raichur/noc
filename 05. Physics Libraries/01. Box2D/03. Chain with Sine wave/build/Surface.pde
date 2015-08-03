class Surface {
  
  ArrayList<Vec2> surface;
  
  Surface() {
    surface = new ArrayList<Vec2>();
    
    float theta = 0;
    
    // Put surface in world
    ChainShape chain = new ChainShape();
    
    // Sine!
    for (float x = width + 10; x > -10; x -= 5) {
      float y = map(cos(theta), -1, 1, 50, height);
      theta += 0.15;
      
      surface.add(new Vec2(x, y));
    }
    
    // 3 Vect2 objects for custom surface
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      Vec2 edge = box2d.coordPixelsToWorld(surface.get(i));
      vertices[i] = edge;
    }
    
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    bd.position.set(0.0f, 0.0f);
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }
  
  void display() {
    stroke(0);
    strokeWeight(1);
    fill(0);
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}
