import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  public void applyForce(PVector f) {
    acceleration = f;
  }

  public void display() {
    stroke(0);
    fill(175);
    // The Mover is displayed
    ellipse(location.x, location.y, 16, 16);
  }

  public void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }

  }

}


// Declare the Mover object
Mover m;

public void setup() {

  size(640, 360);

  m = new Mover();

}

public void draw() {

  background(255);
  PVector force = new PVector(0, 0.1f);

  m.update();
  m.checkEdges();
  m.display();

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
