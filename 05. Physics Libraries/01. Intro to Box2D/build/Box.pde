class Box {
  
  float x, y, w, h;
  
  Box(float x_, float y_) {
    x = x_;
    y = y_;
    w = 16;
    h = 16;
  }
  
  void display() {
    fill(127);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}
