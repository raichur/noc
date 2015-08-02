ArrayList<Box> boxes;

void setup() {
  size(640, 360);
  boxes = new ArrayList<Box>();
}

void draw() {
  background(255);
  
  // Add new box if mouse clicked
  if (mousePressed) {
    Box p = new Box(mouseX, mouseY);
    boxes.add(p);
  }
  
  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
}
