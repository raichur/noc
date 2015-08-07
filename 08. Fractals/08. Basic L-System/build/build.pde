// Basic L-System

String current = "A"; // Starting with current string A
int count = 0; // Number of generation

void setup() {
  size(200, 200);
  println("Generation " + count + ": " + current);
}

void draw() {
  background(255);
  fill(0);
  noLoop();
}

void mousePressed() {
  // A StringBuffer is very efficient for manipulating strings
  StringBuffer next = new StringBuffer();
  
  for(int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if(c == 'A') {
      next.append("ABA");
    } else if(c == 'B'){
      next.append("BBB");
    }
  }
  current = next.toString();
  count++;
  println("Generation " + count + ": " + current);
}

