var paddle;
var ball;
var bricks = [];

var gameOver = true;
var youWin = false;
var winText;
var instructionText;

function setup() {
  createCanvas(windowWidth, windowHeight);
  textAlign(CENTER);

  paddle = new Paddle();
  ball = new Ball();

  createBricks(20);
  createText();
}

function draw() {
  background(255);

  // bricks
  for (var i = bricks.length - 1; i >= 0; i--) {
    if (ball.hits(bricks[i])) {
      if (bricks[i].r >= 40) {
        var newBricks = bricks[i].shrink();
        bricks = bricks.concat(newBricks);
      }
      bricks.splice(i, 1);
      ball.direction.y *= -1;
      break;
    }
    bricks[i].display();
  }

  // paddle
  paddle.display();
  if (!gameOver) paddle.checkEdges();
  if (!gameOver) paddle.update();

  // ball
  if (ball.meets(paddle)) {
    if (ball.direction.y > 0) ball.direction.y *= -1;
  }
  ball.display();
  if (!gameOver) ball.checkEdges();
  if (!gameOver) ball.update();

  // game logics
  if (ball.pos.y > height) {
    ball.pos = createVector(width / 2, height / 2);
    gameOver = true;
  }

  if (bricks.length === 0) {
    youWin = true;
    gameOver = true;
  }

  if (youWin) {
    winText.style('display', 'block');
  } else {
    winText.style('display', 'none');
  }

  if (gameOver) {
    instructionText.style('display', 'block');
  } else {
    instructionText.style('display', 'none');
  }
}

function keyReleased() {
  paddle.isMovingRight = false;
  paddle.isMovingLeft = false;
}

function keyPressed() {
  if (key === 'a' || key === 'A') {
    paddle.isMovingLeft = true;
  } else if (key === 'd' || key === 'D') {
    paddle.isMovingRight = true;
  } else if (key === 's' || key === 'S') {
    if (bricks.length === 0) createBricks(20);
    gameOver = false;
    youWin = false;
  }
}

function createBricks(n) {
  for (var i = 0; i < n; i++) {
    bricks.push(new Brick());
  }
}

function createText() {
  winText = createP('YOU WIN!');
  winText.style('display', 'none');
  winText.position(width / 2 - 50, 80);

  instructionText = createP("Press 'S' to Start, 'A'/'D' to move Right/Left");
  instructionText.style('display', 'none');
  instructionText.position(width / 2 - 240, 100);
}
