class Branch {
  
  PVector start, end, vel;
  float timer, timerStart;
  boolean growing = true;
  
  Branch(PVector l, PVector v, float n) {
    start = l.get();
    end = l.get();
    vel = v.get();
    timerStart = n;
    timer = timerStart;
  }
  
  void update() {
    if(growing) {
      end.add(vel);
    }
  }
  
  void render() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }
  
  boolean timeToBranch() {
    timer--;
    if(timer < 0 && growing) {
      growing = false;
      return true;
    } else {
      return false;
    }
  }
  
  Branch branch(float angle) {
    float theta = vel.heading2D();
    float mag = vel.mag();
    theta += radians(angle);
    PVector newVel = new PVector(mag*cos(theta), mag*sin(theta));
    return new Branch(end, newVel, timerStart*0.66f);
  }
}
