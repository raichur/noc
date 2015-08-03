class Windmill {
  RevoluteJoint joint;
  Box box1;
  Box box2;
  
  Windmill(float x, float y) {
    box1 = new Box(x, y-20, 120, 10, false);
    box2 = new Box(x, y, 10, 40, true);
    
    RevoluteJointDef rjd = new RevoluteJointDef();
    
    rjd.initialize(box1.body, box2.body, box1.body.getWorldCenter());
    
    rjd.motorSpeed = PI*2.5;
    rjd.maxMotorTorque = 1000.0;
    rjd.enableMotor = false;
    
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }
  
  void toggleMotor() {
    joint.enableMotor(!joint.isMotorEnabled());
  }
  
  boolean motorOn() {
    return joint.isMotorEnabled();
  }
  
  void display() {
    box2.display();
    box1.display();
    
    Vec2 anchor = box2d.coordWorldToPixels(box1.body.getWorldCenter());
    fill(0);
    noStroke();
    ellipse(anchor.x, anchor.y, 8, 8);
  }
}
