class Cell {
  
  float x, y, w, xoff, yoff;
  int state, previous;
  
  Cell(float x_, float y_, float w_) {
    x = x_;
    y = y_;
    w = w_;
    xoff = w/2;
    yoff = sin(radians(60))*w;
    
    state = int(random(2));
    previous = state;
  }
  
  void savePrevious() {
    previous = state;
  }
  
  void newState(int s) {
    state = s;
  }
  
  void display() {
    if (state == 1) fill(#009688); // Alive
    else if (previous == 0 && state == 1) fill(#00BCD4); // Just alive
    else if (previous == 1 && state == 0) fill(#D32F2F); // Just dead
    else fill(255);
    stroke(0);
    pushMatrix();
    translate(x, y);
    beginShape();
    // Draw that hexagon!
    vertex(0, yoff);
    vertex(xoff, 0);
    vertex(xoff+w, 0);
    vertex(2*w, yoff);
    vertex(xoff+w, 2*yoff);
    vertex(xoff, 2*yoff);
    vertex(0, yoff);
    endShape();
    popMatrix();
    
  }
  
}
