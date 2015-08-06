float theta;

void setup() {
  size(1000, 600);
  smooth();
}

void draw() {
  background(255);
  theta = PI/6;
  
  translate(width/2, height);
  stroke(0);
  branch(200, 0);
  noLoop();
}

void branch(float len, int level) {
  strokeWeight(2);
  line(0, 0, 0, -len);
  translate(0, -len);
  
  len *= 0.66;
  level++;
  
  if(level < 12) {
    pushMatrix();
    rotate(theta);
    branch(len, level);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    branch(len, level);
    popMatrix();
  }
  
}
