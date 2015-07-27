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

Mover m;
Attractor a;

public void setup() {
  size(640, 360);
  m = new Mover();
  a = new Attractor();
}

public void draw() {
  background(255);

  PVector force = a.attract(m);
  m.applyForce(force);

  m.update();
  a.display();
  m.display();
}

// Attractor class
class Attractor {
  float mass;
  PVector location;
  float G;

  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
    G = 0.4f;
  }

  public PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0f, 25.0f);

    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  public void display() {
    stroke();
    fill(175, 100);
    ellipse(location.x, location.y, mass*2, mass*2);
  }

}

// Mover Class
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // Reset acceleration
    acceleration.mult(0);
  }

  // F = MA
  public void applyForce(PVector force) {
    // New vector
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void display() {
    stroke(0);
    strokeWeight(2);
    fill(175, 100);
    ellipse(location.x, location.y, mass*20, mass*20);
  }

  public void checkEdges() {
    if (location.y > height) {
      velocity.x *= -0.9f;
      location.y = height;
    }
  }

}

public void mousePressed() {
  a.clicked(mouseX, mouseY);
}

public void mouseReleased() {
  a.stopDragging();
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
