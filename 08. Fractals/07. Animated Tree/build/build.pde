ArrayList<Branch> tree;
ArrayList<Leaf> leaves;

void setup() {
  size(640, 360);
  background(255);
  
  tree = new ArrayList<Branch>();
  leaves = new ArrayList<Leaf>();
  Branch b = new Branch(new PVector(width/2, height), new PVector(0, -1), 100);
  tree.add(b);
}

void draw() {
  background(255);
  for(int i = tree.size()-1; i >= 0; i--) {
    Branch b = tree.get(i);
    b.update();
    b.render();
    if(b.timeToBranch()) {
      if(tree.size() < 1024) {
        tree.add(b.branch(30));
        tree.add(b.branch(-25));
      } else {
        leaves.add(new Leaf(b.end));
      }
    }
  }
  for(Leaf leaf: leaves) {
    leaf.display();
  }
}
