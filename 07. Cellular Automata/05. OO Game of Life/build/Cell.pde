class Cell {
  
  float x, y, w;
  int state, previous;
  
  Cell(float x_, float y_, float w_) {
    x = x_;
    y = y_;
    w = w_;
    
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
    rect(x, y, w, w);
  }
  
}
