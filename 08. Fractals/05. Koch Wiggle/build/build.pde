// Koch snowflake

ArrayList<KochLine> lines;

void setup() {
  size(1400, 500);
  background(255);
  lines = new ArrayList<KochLine>();
  PVector start = new PVector(0, 450);
  PVector end = new PVector(width, 450);
  lines.add(new KochLine(start, end));
  
  for(int i = 0; i < 6; i++) {
    generate();
  }
  smooth();
}

void draw() {
  background(255);
  for(KochLine l: lines) {
    l.display();
  }
  if(mousePressed) {
    for(KochLine l: lines) {
      l.wiggle();
    }
  }
}

void generate() {
  ArrayList next = new ArrayList<KochLine>();
  for(KochLine l: lines) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();
    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }
  lines = next;
}
