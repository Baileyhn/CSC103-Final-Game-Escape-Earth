//Adding Sounds
import processing.sound.*;

SoundFile boingSound;
SoundFile astralJourneySound;
SoundFile computerClick;
SoundFile celestialTheme;
SoundFile triads;
SoundFile outOfRange;
SoundFile failureSound;
SoundFile applause;

//declaring my vars
Player p1;

Spaceship ship;

Platform plat1;
Platform plat2;
Platform plat3;
Platform plat4;
Platform plat5;
Platform plat6;
Platform plat7;
Platform plat8;
Platform plat9;
Platform plat10;
Platform plat11;
Platform plat12;
Platform plat13;
Platform plat14;
Platform plat15;
Platform plat16;
Platform plat17;
Platform plat18;
Platform plat19;
Platform plat20;
Platform plat21;
Platform plat22;
Platform plat23;
Platform plat24;
Platform plat25;
Platform plat26;
Platform plat27;
Platform plat28;
Platform plat29;
Platform plat30;
Platform plat31;
Platform plat32;

//Creating ArrayList for platforms
ArrayList<Platform> platformList;

//Loading in the Images
PImage BackgroundSky;
PImage AlienSpaceShip;
PImage Level2Screen;
PImage Level3Screen;
PImage FailureScreen;
PImage WinningScreen;
PImage StartingScreen;

//Loading in the animation for the alien
PImage[] alienImages = new PImage[2];

Animation alienAnimation;

//Setting the background image and spaceship in its starting position
int backgroundY = -1800;
int spaceShipY = -1700;


//Setting up the initial state
int state = 0;

//Boolean for Sound
boolean hasPlayedApplause = false;

void setup() {
  size(1200, 800);

  //Creating Sounds
  boingSound = new SoundFile(this, "zapsplat_cartoon_boing_ascend_jaw_harp_004_24202.wav");
  astralJourneySound = new SoundFile(this, "AstralJourney.wav");
  computerClick = new SoundFile(this, "ComputerClick.wav");
  celestialTheme = new SoundFile(this, "CelestialTheme.wav");
  triads = new SoundFile(this, "Triads.wav");
  outOfRange = new SoundFile(this, "OutofRange.wav");
  failureSound = new SoundFile(this, "FailureSound.wav");
  applause = new SoundFile(this, "ApplauseSound.wav");
  
  applauseSounds();

  //Creating Images
  BackgroundSky = loadImage("BackgroundSky.png");
  AlienSpaceShip = loadImage("BetterAlienSpaceship.png");
  Level2Screen = loadImage("Level2Screen.png");
  Level3Screen = loadImage("Level3Screen.png");
  FailureScreen = loadImage("FailureScreen.png");
  WinningScreen = loadImage("WinningScreen.png");
  StartingScreen = loadImage("StartingScreen.png");


  //Array of alien images
  for (int i=0; i<alienImages.length; i++) {
    alienImages[i] = loadImage("AlienRealistic"+i+".png");
  }

  //Initialize alien object
  alienAnimation = new Animation(alienImages, 0.09, 0.7);

  //initialize my vars
  p1 = new Player(width/2, height-200, 50, 50, color(255), alienAnimation);
  ship = new Spaceship(width/2+200, spaceShipY+250, 400, 200, color(255));

  plat1 = new Platform(width/2, height-200, 200, 20, color(179, 229, 252));
  plat2 = new Platform(int(random(200, 800)), height-400, 200, 20, color(179, 229, 252));
  plat3 = new Platform(int(random(200, 800)), height-600, 200, 20, color(179, 229, 252));
  plat4 = new Platform(int(random(200, 800)), height-800, 200, 20, color(44, 79, 153));
  plat5 = new Platform(int(random(200, 800)), height-1000, 200, 20, color(44, 79, 153));
  plat6 = new Platform(int(random(200, 800)), height-1200, 200, 20, color(80, 61, 156));
  plat7 = new Platform(int(random(200, 800)), height-1400, 200, 20, color(80, 61, 156));
  plat8 = new Platform(int(random(200, 800)), height-1600, 200, 20, color(102, 81, 145));
  plat9 = new Platform(int(random(200, 800)), height-1800, 200, 20, color(102, 81, 145));
  plat10 = new Platform(int(random(200, 800)), height-2000, 200, 20, color(22, 10, 94));
  plat11 = new Platform(int(random(200, 800)), height-2200, 200, 20, color(22, 10, 94));
  plat12 = new Platform(int(random(200, 800)), height-2400, 200, 20, color(13, 6, 54));
  plat13 = new Platform(int(random(200, 800)), height-2600, 200, 20, color(13, 6, 54));
  plat14 = new Platform(int(random(200, 800)), height-2800, 200, 20, color(9, 4, 36));
  plat15 = new Platform(int(random(200, 800)), height-3000, 200, 20, color(9, 4, 36));
  plat16 = new Platform(int(random(200, 800)), height-3200, 200, 20, color(5, 2, 18));
  plat17 = new Platform(int(random(200, 800)), height-3400, 200, 20, color(5, 2, 18));
  plat18 = new Platform(int(random(200, 800)), height-3600, 200, 20, color(5, 2, 18));
  plat19 = new Platform(int(random(200, 800)), height-3800, 200, 20, color(5, 2, 18));
  plat20 = new Platform(int(random(200, 800)), height-4000, 200, 20, color(5, 2, 18));
  plat21 = new Platform(int(random(200, 800)), height-4200, 200, 20, color(5, 2, 18));
  plat22 = new Platform(int(random(200, 800)), height-4400, 200, 20, color(5, 2, 18));
  plat23 = new Platform(int(random(200, 800)), height-4600, 200, 20, color(5, 2, 18));
  plat24 = new Platform(int(random(200, 800)), height-4800, 200, 20, color(5, 2, 18));
  plat25 = new Platform(int(random(200, 800)), height-5000, 200, 20, color(5, 2, 18));
  plat26 = new Platform(int(random(200, 800)), height-5200, 200, 20, color(5, 2, 18));
  plat27 = new Platform(int(random(200, 800)), height-5400, 200, 20, color(5, 2, 18));
  plat28 = new Platform(int(random(200, 800)), height-5600, 200, 20, color(5, 2, 18));
  plat29 = new Platform(int(random(200, 800)), height-5800, 200, 20, color(5, 2, 18));
  plat30 = new Platform(int(random(200, 800)), height-6000, 200, 20, color(5, 2, 18));
  plat31 = new Platform(int(random(200, 800)), height-6200, 200, 20, color(5, 2, 18));
  plat32 = new Platform(int(random(200, 800)), height-6400, 200, 20, color(5, 2, 18));

  platformList = new ArrayList<Platform> ();

  platformList.add(plat1);
  platformList.add(plat2);
  platformList.add(plat3);
  platformList.add(plat4);
  platformList.add(plat5);
  platformList.add(plat6);
  platformList.add(plat7);
  platformList.add(plat8);
  platformList.add(plat9);
  platformList.add(plat10);
  platformList.add(plat11);
  platformList.add(plat12);
  platformList.add(plat13);
  platformList.add(plat14);
  platformList.add(plat15);
  platformList.add(plat16);
  platformList.add(plat17);
  platformList.add(plat18);
  platformList.add(plat19);
  platformList.add(plat20);
  platformList.add(plat21);
  platformList.add(plat22);
  platformList.add(plat23);
  platformList.add(plat24);
  platformList.add(plat25);
  platformList.add(plat26);
  platformList.add(plat27);
  platformList.add(plat28);
  platformList.add(plat29);
  platformList.add(plat30);
  platformList.add(plat31);
  platformList.add(plat32);
}

void draw() {
  playerLoses();

  switch(state) {

    //THIS IS STARTING SCREEN
  case 0:
    background(StartingScreen);
    if (triads.isPlaying() == false) {
      triads.play();
    }
    break;

    //THIS IS LEVEL 1
  case 1:
    triads.stop();

    image(BackgroundSky, width-width, backgroundY);
    image(AlienSpaceShip, width/2 + 50, spaceShipY);

    p1.render();
    p1.move();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    p1.fallOffPlatform(platformList);

    ship.render();
    ship.collideWithSpaceShip(p1);

    movingBackground();

    if (astralJourneySound.isPlaying() == false) {
      astralJourneySound.play();
    }

    //for loop to go through all platforms
    for (Platform aPlatform : platformList) {
      aPlatform.render();
      aPlatform.collideWithPlayer(p1);
      aPlatform.movePlatforms();
    }

    playerNextLevel();
    break;
    //THIS IS INTRO SCREEN FOR LEVEL 2
  case 2:
    background(Level2Screen);
    astralJourneySound.stop();
    if (triads.isPlaying() == false) {
      triads.play();
    }
    break;

    //THIS IS LEVEL 2
  case 3:
    triads.stop();

    image(BackgroundSky, width-width, backgroundY);
    image(AlienSpaceShip, width/2 + 50, spaceShipY);

    p1.render();
    p1.move();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    p1.fallOffPlatform(platformList);


    ship.render();
    ship.collideWithSpaceShip(p1);

    movingBackground();


    if (astralJourneySound.isPlaying() == false) {
      astralJourneySound.play();
    }

    //for loop to go through all platforms
    for (Platform aPlatform : platformList) {
      aPlatform.render();
      aPlatform.collideWithPlayer(p1);
      aPlatform.movePlatforms();
      aPlatform.speed = 4;
    }

    playerNextLevel();
    break;

    //THIS IS INTRO SCREEN FOR LEVEL 3
  case 4:
    background(Level3Screen);
    astralJourneySound.stop();
    if (triads.isPlaying() == false) {
      triads.play();
    }
    break;

    //THIS IS LEVEL 3
  case 5:
    triads.stop();
    //Loading Images Needed
    image(BackgroundSky, width-width, backgroundY);
    image(AlienSpaceShip, width/2 + 50, spaceShipY);

    p1.render();
    p1.move();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    p1.fallOffPlatform(platformList);

    playerWins();
    //PlayerNextLevel();

    ship.render();
    ship.collideWithSpaceShip(p1);

    movingBackground();

    if (astralJourneySound.isPlaying() == false) {
      astralJourneySound.play();
    }

    //for loop to go through all platforms
    for (Platform aPlatform : platformList) {
      aPlatform.render();
      aPlatform.collideWithPlayer(p1);
      aPlatform.movePlatforms();
      aPlatform.speed = 5;
    }
    break;

  case 6:
    background(FailureScreen);
    if (failureSound.isPlaying() == false) {
      failureSound.play();
    }
    astralJourneySound.stop();
    triads.stop();
    break;

  case 7:
    background(WinningScreen);
    failureSound.stop();
    astralJourneySound.stop();
    triads.stop();
    if (outOfRange.isPlaying() == false) {
      outOfRange.play();
    }
   // applauseSounds();
    //hasPlayedApplause = true;
   // applauseSounds();
      break;
  }
  //  println(ship.isCollidingWithPlayer);
}

void keyPressed() {
  if (key == 'a') {
    p1.isMovingLeft = true;
  }

  if (key == 'd') {
    p1.isMovingRight = true;
  }

  if (key == 'w' && p1.isJumping == false && p1.isFalling == false) {
    p1.isJumping = true; //start a new jump
    p1.highestY = p1.y - p1.jumpHeight;
    p1.animation.isAnimating = true;

    boingSound.play();
  }

  if (key == 's') {
    p1.isFalling = true;
  }

  if (key == ' ' && state == 0) {
    state = 1;
    computerClick.play();
  }

  if (key == '2' && state == 2) {
    state = 3;
    reset();
    computerClick.play();
  }

  if (key == '3' && state == 4) {
    state = 5;
    reset();
    computerClick.play();
  }
}

void keyReleased() {
  if (key == 'a') {
    p1.isMovingLeft = false;
  }

  if (key == 'd') {
    p1.isMovingRight = false;
  }
}

void movingBackground() {
  if (p1.isJumping == true && backgroundY < 0) {
    backgroundY = backgroundY + p1.speed;
    spaceShipY = spaceShipY + p1.speed;
  }
}


void playerLoses() {
  if (p1.y + p1.h/2 == height) {
    state = 6;
  }
}

void playerNextLevel() {
  if (ship.isCollidingWithPlayer == true) {
    state = state + 1;
    p1.x = width/2;
    p1.y = height-200;
    ship.isCollidingWithPlayer = false;
  }
}

void playerWins() {
  if (ship.isCollidingWithPlayer == true && state == 5) {
    state = 7;
  }
}

void reset() {
  p1.y = height-200;
  p1.x = width/2;

    plat1 = new Platform(width/2, height-200, 200, 20, color(179, 229, 252));
  plat2 = new Platform(int(random(200, 800)), height-400, 200, 20, color(179, 229, 252));
  plat3 = new Platform(int(random(200, 800)), height-600, 200, 20, color(179, 229, 252));
  plat4 = new Platform(int(random(200, 800)), height-800, 200, 20, color(44, 79, 153));
  plat5 = new Platform(int(random(200, 800)), height-1000, 200, 20, color(44, 79, 153));
  plat6 = new Platform(int(random(200, 800)), height-1200, 200, 20, color(80, 61, 156));
  plat7 = new Platform(int(random(200, 800)), height-1400, 200, 20, color(80, 61, 156));
  plat8 = new Platform(int(random(200, 800)), height-1600, 200, 20, color(102, 81, 145));
  plat9 = new Platform(int(random(200, 800)), height-1800, 200, 20, color(102, 81, 145));
  plat10 = new Platform(int(random(200, 800)), height-2000, 200, 20, color(22, 10, 94));
  plat11 = new Platform(int(random(200, 800)), height-2200, 200, 20, color(22, 10, 94));
  plat12 = new Platform(int(random(200, 800)), height-2400, 200, 20, color(13, 6, 54));
  plat13 = new Platform(int(random(200, 800)), height-2600, 200, 20, color(13, 6, 54));
  plat14 = new Platform(int(random(200, 800)), height-2800, 200, 20, color(9, 4, 36));
  plat15 = new Platform(int(random(200, 800)), height-3000, 200, 20, color(9, 4, 36));
  plat16 = new Platform(int(random(200, 800)), height-3200, 200, 20, color(5, 2, 18));
  plat17 = new Platform(int(random(200, 800)), height-3400, 200, 20, color(5, 2, 18));
  plat18 = new Platform(int(random(200, 800)), height-3600, 200, 20, color(5, 2, 18));
  plat19 = new Platform(int(random(200, 800)), height-3800, 200, 20, color(5, 2, 18));
  plat20 = new Platform(int(random(200, 800)), height-4000, 200, 20, color(5, 2, 18));
  plat21 = new Platform(int(random(200, 800)), height-4200, 200, 20, color(5, 2, 18));
  plat22 = new Platform(int(random(200, 800)), height-4400, 200, 20, color(5, 2, 18));
  plat23 = new Platform(int(random(200, 800)), height-4600, 200, 20, color(5, 2, 18));
  plat24 = new Platform(int(random(200, 800)), height-4800, 200, 20, color(5, 2, 18));
  plat25 = new Platform(int(random(200, 800)), height-5000, 200, 20, color(5, 2, 18));
  plat26 = new Platform(int(random(200, 800)), height-5200, 200, 20, color(5, 2, 18));
  plat27 = new Platform(int(random(200, 800)), height-5400, 200, 20, color(5, 2, 18));
  plat28 = new Platform(int(random(200, 800)), height-5600, 200, 20, color(5, 2, 18));
  plat29 = new Platform(int(random(200, 800)), height-5800, 200, 20, color(5, 2, 18));
  plat30 = new Platform(int(random(200, 800)), height-6000, 200, 20, color(5, 2, 18));
  plat31 = new Platform(int(random(200, 800)), height-6200, 200, 20, color(5, 2, 18));
  plat32 = new Platform(int(random(200, 800)), height-6400, 200, 20, color(5, 2, 18));
  
  platformList = new ArrayList<Platform> ();

  platformList.add(plat1);
  platformList.add(plat2);
  platformList.add(plat3);
  platformList.add(plat4);
  platformList.add(plat5);
  platformList.add(plat6);
  platformList.add(plat7);
  platformList.add(plat8);
  platformList.add(plat9);
  platformList.add(plat10);
  platformList.add(plat11);
  platformList.add(plat12);
  platformList.add(plat13);
  platformList.add(plat14);
  platformList.add(plat15);
  platformList.add(plat16);
  platformList.add(plat17);
  platformList.add(plat18);
  platformList.add(plat19);
  platformList.add(plat20);
  platformList.add(plat21);
  platformList.add(plat22);
  platformList.add(plat23);
  platformList.add(plat24);
  platformList.add(plat25);
  platformList.add(plat26);
  platformList.add(plat27);
  platformList.add(plat28);
  platformList.add(plat29);
  platformList.add(plat30);
  platformList.add(plat31);
  platformList.add(plat32);

  backgroundY = -1800;
  spaceShipY = -1700;
  ship = new Spaceship(width/2+200, spaceShipY+250, 400, 200, color(255));
}

void applauseSounds() {
  if (hasPlayedApplause == true){
  applause.play();
    }
}
