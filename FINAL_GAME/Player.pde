class Player {

  //variables
  int x;
  int y;

  int w;
  int h;

  color fillC;

  boolean isMovingLeft;
  boolean isMovingRight;

  boolean isJumping;
  boolean isFalling;

  int speed;

  int jumpHeight; //distance that you can jump upwards
  int highestY; //y value of the top of your jump

  int left;
  int right;
  int top;
  int bottom;

  Animation animation;

  //constructor
  Player(int startingX, int startingY, int startingW, int startingH, color aFillC, Animation startingAnimation) {
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    fillC = aFillC;

    animation = startingAnimation;

    isMovingLeft = false;
    isMovingRight = false;

    isJumping = false;
    isFalling = false;

    speed = 10;

    jumpHeight = 200;
    highestY = y - jumpHeight;

    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  //functions
  //this function draws the plater
  void render() {
    rectMode(CENTER);
    fill(255);
   // rect(x, y, w, h);
    animation.display(x, y);
  }

  //this function moves the player with WASD
  void move() {
    if (isMovingLeft == true) {
      x = x - speed;
    }

    if (isMovingRight == true) {
      x = x + speed;
    }

    //update the bounds of the player
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  //this function controls the player when it jumps
  void jumping() {
    if (isJumping == true) {
      y = y - speed;
    }
  }

  //this function controls the player when it falls
  void falling() {
    if (isFalling == true) {
      y = y + speed;
    }
  }

  //this function determines the maximum height a player can jump up
  void topOfJump() {
    if (y <= highestY) {
      isJumping = false; //stop jumping upward
      isFalling = true; //start falling downward
    }
  }

  //this function helps the player land on the platform he is jumping to
  void land() {
    if (y >= height - h/2) {
      isFalling = false; //stop falling
      y = height - h/2; //snap player to the bottom of the window
    }
  }

  //check to see if the player is colliding with any platforms
  //if the player is NOT colliding with any platforms, then
  //make the player stop falling

  //this functions helps to determine if a player falls off a platform

  void fallOffPlatform(ArrayList<Platform> aPlatformList) {

    //check that the player is not in the middle of a jump
    //and check that the player is not on the ground

    if (isJumping == false && y < height- h/2) {

      boolean onPlatform = false;

      for (Platform aPlatform : aPlatformList) {
        if (top <= aPlatform.bottom &&
          bottom >= aPlatform.top &&
          left <= aPlatform.right &&
          right >= aPlatform.left) {
          onPlatform = true; //make onPlatform true
          isFalling = false;
        }
      }
      //if you are not a platform, stop falling
      if (onPlatform == false) {
        isFalling = true;
      }
    }
  }
}
