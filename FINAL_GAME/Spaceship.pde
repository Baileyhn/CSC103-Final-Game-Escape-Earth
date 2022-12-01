class Spaceship {

  //variables
  int x;
  int y;

  int w;
  int h;

  color fillC;

  int left;
  int right;
  int top;
  int bottom;
  
  boolean isCollidingWithPlayer = false;

  //constructor
  Spaceship(int startingX, int startingY, int startingW, int startingH, color aFillC) {

    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    fillC = aFillC;

    left = x - w/2;
    right = x + w/2;
    top = spaceShipY - h/2;
    bottom = spaceShipY + h/2;
  }

  //this function draws the spaceship itself
  void render() {
    fill(fillC);
    y = spaceShipY+200;
    top = spaceShipY - h/2;
    bottom = spaceShipY + h/2;
    //stroke(255,0,0);
    //rect(x, y, w, h);
    //image(AlienSpaceShip, x, spaceShipY, w, h);
  }
  
   //this function determines if a player collides with the spaceship
  void collideWithSpaceShip(Player aPlayer) {
    //if player collides with a the spaceship
    if (left <= aPlayer.right &&
      right >= aPlayer.left &&
      top <= aPlayer.bottom &&
      bottom >= aPlayer.top) {
        
      isCollidingWithPlayer = true;
      
    //  println("player hit spaceship");
    }
  }
}
