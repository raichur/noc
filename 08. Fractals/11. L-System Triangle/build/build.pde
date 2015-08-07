LSystem lsys;
Turtle turtle;

void setup() {
  size(600, 520);
  Rule[] ruleset = new Rule[2];
  ruleset[0] = new Rule('F', "F--F--F--G");
  ruleset[1] = new Rule('G', "GG");
  lsys = new LSystem("F--F--F", ruleset);
  turtle = new Turtle(lsys.getSentence(), width*2, TWO_PI/3);
}

void draw() {
  background(255);
  fill(0);
  translate(width, height);
  rotate(PI);
  turtle.render();
  noLoop();
}

int counter = 0;

void mousePressed() {
  if(counter < 8) {
    pushMatrix();
    lsys.generate();
    turtle.setToDo(lsys.getSentence());
    turtle.changeLen(0.5);
    popMatrix();
    redraw();
    counter++;
  }
}
