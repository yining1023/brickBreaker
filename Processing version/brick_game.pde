//Carlos Angelo //<>//
//Based on Yining Shi video
//https://www.youtube.com/watch?v=5kEPixL8JoU
//https://github.com/yining1023/brickBreaker
//Sorry for my english

//All global variables
Paddle paddle;
Ball ball;
ArrayList<Brick> bricks = new ArrayList<Brick>();
int score;
int lvl = 1;
boolean htp = true;
GameSystem systemG;
ArrayList<Block> blocks = new ArrayList<Block>();



void setup() {
  size(800, 600);
  systemG = new GameSystem();
  score = 0;
  paddle = new Paddle();
  ball = new Ball();
  spawnBricks();
  noLoop();
}

void keyReleased() {
  paddle.isMovingRight = false;
  paddle.isMovingLeft = false;
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    paddle.isMovingLeft = true;
  }
  if (key == 'd' || key == 'D') {
    paddle.isMovingRight = true;
  }
  if (key == 's' || key == 'S') {
    loop();
    htp = false;
  }
}

void draw() {
  background(240);
  checkBricks();
  systemG.displayScore(); //Display the score

  //Paddle
  paddle.display(); //Display the paddle
  paddle.update(); //Update the paddle

  //Ball
  ball.display(); //Display the ball
  ball.update(); //Update the ball
  ball.checkEdges(); //Check if the ball hits the edges of the screen

  //Check if ball hits Paddle
  if (ball.meets(paddle)) {
    ball.speed.y *= -1;   //If did the ball reverse direction
  }
  checkBlocks();
  changeLevel();
  if (htp) {
    systemG.displayHtp();
  }
  if (ball.lose()) {
    systemG.loseMsg();
  }
}

//Change level and check if the player win
void changeLevel() {
  if (lvl <= 10) {
    if (bricks.size() == 0) {
      blocks.add(new Block());
      lvl += 1;
      score += 100;
      spawnBricks();
    }
  } else {
    systemG.winMsg();
  }
}

//Spawn all bricks
void spawnBricks() {
  for (int i=0; i < 9 + lvl; i++) {
    bricks.add(new Brick());
  }
}

//Display All blocks
//and check if ball hit block.
void checkBlocks() {
  for (int i = 0; i < blocks.size(); i++) {
    Block block = blocks.get(i);
    block.show(); //Display ball
    if (ball.hitsBlock(block)) {
      //If did the ball reverse direction
      ball.speed.y *= -1;
    }
  }
}


//set up all Bricks
//check if ball hits a brick
//and destroy
void checkBricks() {
  for (int i = 0; i < bricks.size(); i++) {
    Brick brick = bricks.get(i);
    brick.display(); //Display the brick
    if (ball.hits(brick)) { //check if ball hits a brick
      ball.speed.y *= -1;
      if (brick.r >= 40) {
        brick.r = brick.r / 2; 
        brick.chooseColor(); //change the color of brick
      } else {
        bricks.remove(i);
      }    
      score += 15;
    }
  }
}
