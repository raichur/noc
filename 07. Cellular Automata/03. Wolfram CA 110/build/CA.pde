class CA {
  int[] cells; // Array of cells
  int generation; // Number of generations
  int[] ruleset = {0, 1, 1, 1, 0, 1, 1, 0}; // (RULE 110) Simple ruleset, fascinating result!
  int w = 10;
  
  CA() {
    cells = new int[width/w];
    for(int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
    generation = 0;
  }
  
  void generate() {
    // Empty array for new values
    int[] nextGen = new int[cells.length];
    
    for(int i = 1; i < cells.length - 1; i++) {
      int left = cells[i-1]; // State of left neighbor
      int me = cells[i]; // State
      int right = cells[i+1]; // State of right neighbor
      nextGen[i] = rules(left, me, right); // Get next gen
    }

    cells = nextGen;
    generation++;
  }
  
  void display() {
    for(int i = 0; i < cells.length; i++) {
      if(cells[i] == 1) {
        fill(0);
      } else {
       fill(255);
      }
     noStroke();
    rect(i*w, generation*w, w, w); 
    }
  }
  
  // Compute next gen based on Wolfram CA rules
  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleset[index];
  }
  
  
}
