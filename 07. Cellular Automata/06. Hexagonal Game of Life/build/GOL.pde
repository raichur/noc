// Based on this interesting article in Scientific American: http://www.ibiblio.org/lifepatterns/october1970.html

class GOL {
  
  int w = 10;
  float h = sin(radians(60))*w;
  int columns, rows;
  
  // GOL 2D array
  Cell[][] board;
  
  GOL() {
    columns = width/int(w*3);
    rows = height/int(h);
    board = new Cell[columns][rows];
    init();
  }
  
  void init() {
    for(int i = 0; i < columns; i++) {
      for(int j = 0; j < rows; j++) {
        if(j % 2 == 0) board[i][j] = new Cell(i*w*3, j*h, w);
        else board[i][j] = new Cell(i*w*3+w+h/2, j*h, w);
      }
    }
  }
  
  void generate() {
    
    for(int i = 0; i < columns; i++) {
      for(int j = 0; j < rows; j++) {
        board[i][j].savePrevious();
      }
    }
    
    // Get cells in the neighborhood
    for(int x = 1; x < columns - 1; x++) {
      for(int y = 1; y < rows - 1; y++) {
        
        int neighbors = 0;
        for(int i = -1; i <= 1; i++) {
          for(int j = -1; j <= 1; j++) {
            neighbors += board[(x + i + columns) % columns][(y + j + rows) % rows].previous;
          }
        }
        // Subtract the current cell's state
        neighbors -= board[x][y].previous;
        
        // RULES OF LIFE: What we think as the characteristics and behaviors exhibited by biological systems of reproduction
        // John Conway's goals, again based on the Scientic American article mentioned above:
        // 1. There should be no initial pattern for which there is a simple proof that the population can grow without limit.
        // 2. There should be initial patterns that apparently do grow without limit
        // 3. There should be simple initial patterns that grow and change for a considerable period of time before coming to an end
        //    in three possible ways: fading way completely (from overcrowding or becoming too sparse), 
        //    settling into a stable configuration that remains unchanged thereafter,
        //    or entering an oscillating phase in which they repeat an endless cycle of two or more periods.
        if((board[x][y].state == 1) && (neighbors < 2)) board[x][y].newState(0); // Loneliness
        else if((board[x][y].state == 1) && (neighbors > 3)) board[x][y].newState(0); // Overpopulation
        else if((board[x][y].state == 0) && (neighbors == 3)) board[x][y].newState(1); // Reproduction
      }
    }
  }
  
  void display() {
    for(int i = 0; i < columns; i++) {
      for(int j = 0; j < rows; j++) {
        board[i][j].display();
      }
    }
  }
}
