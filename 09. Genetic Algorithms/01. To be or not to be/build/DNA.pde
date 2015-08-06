class DNA {
  
  char[] genes;
  float fitness;
  
  DNA(int num) {
    genes = new char[num];
    for(int i = 0; i < genes.length; i++) {
      genes[i] = (char)random(32, 128);
    }
  }
  
  String getPhrase() {
    return new String(genes);
  }
  
  void fitness(String target) {
    int score = 0;
    for(int i = 0; i < genes.length; i++) {
      if(genes[i] == target.charAt(i)) {
        score++;
      }
    }
    fitness = (float)score/(float)target.length();
  }
  
  DNA crossover(DNA partner) {
    DNA child = new DNA(genes.length);
    int midPoint = int(random(genes.length));
    
    for(int i = 0; i < genes.length; i++) {
      if(i > midPoint) {
        child.genes[i] = genes[i];
      } else {
        child.genes[i] = partner.genes[i];
      }
    }
    return child;
  }
    
  void mutate(float mutationRate) {
    for(int i = 0; i < genes.length; i++) {
      if(random(1) < mutationRate) {
        genes[i] = (char)random(32, 128);
      }
    }
  }
  
}
