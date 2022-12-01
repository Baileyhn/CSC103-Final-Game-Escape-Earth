class Platform {

  //variables
  int x;
  int y;
  int w;
  int h;

  int left;
  int right;
  int top;
  int bottom;

  int speed;

  color platformColor;

  //constructor
  Platform(int startingX, int startingY, int startingW, int startingH, color aPlatformColor) {
    rectMode(CENTER);

    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    platformColor = aPlatformColor;

    speed = 3;

    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  //this function draws the platform itself
  void render() {
  fill(platformColor);
  stroke(255);
  strokeWeight(2);
  rect(x, y, w, h, 10);
  }

  //this function determines if a player collides with on of the platforms
  void collideWithPlayer(Player aPlayer) {
    //if player collides with a plaform
    if (left < aPlayer.right &&
      right > aPlayer.left &&
      top < aPlayer.bottom &&
      bottom > aPlayer.top) {

      aPlayer.isFalling = false; //stop falling
      aPlayer.isJumping = false;
      aPlayer.y = y - h/2 - aPlayer.h/2;
    }
  }
  //this function causes the platforms to move down the screen
  void movePlatforms() {

    if (top <= p1.bottom &&
      bottom >= p1.top &&
      left <= p1.right &&
      right >= p1.left) {
      p1.y = p1.y + speed;
    }

     y = y + speed;

    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
}
