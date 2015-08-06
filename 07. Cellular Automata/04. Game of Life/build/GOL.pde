// Based on this interesting article in Scientific American: http://www.ibiblio.org/lifepatterns/october1970.html

class GOL {
  
  int w = 5;
  int columns, rows;
  
  // GOL 2D array
  int[][] board;
  
  GOL() {
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows];
    init();
  }
  
  void init() {
    for(int i = 1; i < columns - 1; i++) {
      for(int j = 1; j < rows - 1; j++) {
        board[i][j] = int(random(2));
      }
    }
  }
  
  void generate() {
    int[][] next = new int[columns][rows];
    
    // Get cells in the neighborhood
    for(int x = 1; x < columns - 1; x++) {
      for(int y = 1; y < rows - 1; y++) {
        
        int neighbors = 0;
        for(int i = -1; i <= 1; i++) {
          for(int j = -1; j <= 1; j++) {
            neighbors += board[x + i][y + j];
          }
        }
        // Subtract the current cell's state
        neighbors -= board[x][y];
        
        // RULES OF LIFE: What we think as the characteristics and behaviors exhibited by biological systems of reproduction
        // John Conway's goals, again based on the Scientic American article mentioned above:
        // 1. There should be no initial pattern for which there is a simple proof that the population can grow without limit.
        // 2. There should be initial patterns that apparently do grow without limit
        // 3. There should be simple initial patterns that grow and change for a considerable period of time before coming to an end
        //    in three possible ways: fading way completely (from overcrowding or becoming too sparse), 
        //    settling into a stable configuration that remains unchanged thereafter,
        //    or entering an oscillating phase in which they repeat an endless cycle of two or more periods.
        if((board[x][y] == 1) && (neighbors < 2)) next[x][y] = 0; // Loneliness
        else if((board[x][y] == 1) && (neighbors > 3)) next[x][y] = 0; // Overpopulation
        else if((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1; // Reproduction
        else next[x][y] = board[x][y]; // Equilibrium
      }
    }
    // Switch to next board
    board = next;
  }
  
  void display() {
    for(int i = 0; i < columns; i++) {
      for(int j = 0; j < rows; j++) {
        if((board[i][j] == 1)) {
          fill(0);
        } else {
         fill(255);
        }
       stroke(0);
      rect(i*w, j*w, w, w); 
      }
    }
  }
}
