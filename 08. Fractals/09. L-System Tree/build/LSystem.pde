class LSystem {
  
  String sentence;
  Rule[] ruleset;
  int generation;
  
  LSystem(String axiom, Rule[] r) { // LSystems have an axiom (starting sentence) and a ruleset
    sentence = axiom;
    ruleset = r;
    generation = 0;
  }
  
  void generate() {
    // New empty string buffer
    StringBuffer nextgen = new StringBuffer();
    // Every char in sentence
    for(int i = 0; i < sentence.length(); i++) {
      char current = sentence.charAt(i);
      // Replace it with itself unless it matches a rule
      String replace = "" + current;
      
      // Check the rules
      for(int j = 0; j < ruleset.length; j++) {
        char a = ruleset[j].getA();
        if(a == current) {
          // Get replacement string if match
          replace = ruleset[j].getB();
          break;
        }
      }
      // Append replacement
      nextgen.append(replace);
    }
    sentence = nextgen.toString();
    generation++;
  }
  
  String getSentence() {
    return sentence;
  }
  
  int getGeneration() {
    return generation;
  }
}
