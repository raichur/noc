LSystem lsys;
Turtle turtle;

void setup() {
  size(600, 600);
  Rule[] ruleset = new Rule[1];
  ruleset[0] = new Rule('F', "F[F]-F+F[--F]+F-F");
  lsys = new LSystem("F-F-F-F", ruleset);
  turtle = new Turtle(lsys.getSentence(), width/5, PI/2);
}

void draw() {
  background(255);
  fill(0);
  translate(width, height);
  rotate(-PI/2);
  turtle.render();
  noLoop();
}

int counter = 0;

void mousePressed() {
  if(counter < 4) {
    pushMatrix();
    lsys.generate();
    turtle.setToDo(lsys.getSentence());
    turtle.changeLen(0.5);
    popMatrix();
    redraw();
    counter++;
  }
}
