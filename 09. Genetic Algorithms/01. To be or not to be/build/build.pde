PFont f;
String target;
int populationMax;
float mutationRate;
Population population;

void setup() {
  size(640, 360);
  f = createFont("Karla", 32, true);
  target = "To be or not to be.";
  populationMax = 150;
  mutationRate = 0.01;
  // Create a population
  population = new Population(target, mutationRate, populationMax);
}

void draw() {
  
  // Mating pool
  population.naturalSelection();
  
  // Next generation
  population.generate();
  
  // Fitness
  population.calculateFitness();
  
  displayInfo();
  
  // Stop if target found
  if(population.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
}

void displayInfo() {
  background(255);
  // Display current status
  String answer = population.getBest();
  textFont(f);
  textAlign(LEFT);
  fill(0);
  
  textSize(28);
  text("Best phrase: ", 20, 30);
  text(answer, 20, 100);
  
  textSize(18);
  text("Total generations:    " + population.getGenerations(), 20, 160);
  text("Average fitness:      " + nf(population.getAverageFitness(), 0, 2), 20, 180);
  text("Total population:     " + populationMax, 20, 200);
  text("Mutation rate:        " + int(mutationRate * 100) + '%', 20, 220);
  
  textSize(10);
  text("All phrases:\n" + population.allPhrases(), 500, 10);
}
