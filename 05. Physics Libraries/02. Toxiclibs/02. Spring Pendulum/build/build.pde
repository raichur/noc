import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;

Chain chain;

void setup() {
  size(640, 360);
  
  // Initialize the physics
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0,0.1)));
  
  // Set bounding box
  physics.setWorldBounds(new Rect(0, 0, width, height));
  
  // Init chain
  chain = new Chain(180, 20, 16, 0.2);
  
}

void draw() {
  background(255);
  // Update the physics world
  physics.update();
  chain.updateTail(mouseX, mouseY);
  chain.display();
}

void mousePressed() {
  chain.contains(mouseX, mouseY);
}

void mouseReleased() {
  chain.release();
}
