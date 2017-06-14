var board;
var ball;
var bricks = [];
var gameOver = true;
var youWin = false;
var winText;
var instructionText;

function setup() {
  createCanvas(windowWidth, windowHeight);
  ellipseMode(CENTER);
  textAlign(CENTER);
  noFill();
  stroke(0);

  board = new Board();
  ball = new Ball();

  createBricks(15);
  createText();
}

function createBricks(n) {
  for (var i = 0; i < n; i++) {
    bricks.push(new Brick());
  }
}

function createText() {
  winText = createP('🎉🎉🎉YOU WIN!🎉🎉🎉');
  winText.style('font-family', 'HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue');
  winText.style('font-size', '32px');
  winText.style('display', 'none');
  winText.position(width / 2 - 165, 100);

  instructionText = createP("Press 'S' to Start, 'A' / 'D' to move Right / Left");
  instructionText.style('font-family', 'HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue');
  instructionText.style('font-size', '24px');
  instructionText.style('display', 'none');
  instructionText.position(width / 2 - 200, 80);
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

  // board
  board.display();
  if (!gameOver) board.checkEdges();
  if (!gameOver) board.update();

  // ball
  if (ball.meets(board)) {
    if (ball.direction.y > 0) ball.direction.y *= -1;
  }
  ball.display();
  if (!gameOver) ball.checkEdges();
  if (!gameOver) ball.update();

  if (ball.pos.y > height - ball.r) {
    ball.pos = createVector(random(ball.r * 2, width - ball.r), height - 500);
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
  board.isMovingRight = false;
  board.isMovingLeft = false;
}

function keyPressed() {
  if (key === 'a' || key === 'A') {
    board.isMovingLeft = true;
  } else if (key === 'd' || key === 'D') {
    board.isMovingRight = true;
  } else if (key === 's' || key === 'S') {
    if (bricks.length === 0) createBricks(15);
    gameOver = false;
    youWin = false;
  }
}
