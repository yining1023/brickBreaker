function Ball(pos) {
  if (pos) {
    this.pos = pos.copy();
  } else {
    this.pos = createVector(width / 2, height - 250);
  }

  this.r = 30;
  this.vel = createVector(1, random(1, 2)).mult(4);
  this.direction = createVector(1, 1);

  this.update = function() {
    this.pos.x += this.vel.x * this.direction.x;
    this.pos.y += this.vel.y * this.direction.y;
  }

  this.display = function() {
    stroke('#ed225d');
    ellipse(this.pos.x, this.pos.y, this.r * 2, this.r * 2);
    stroke(0);
  }

  this.checkEdges = function() {
    if (this.pos.x > width - this.r || this.pos.x < this.r) {
      this.direction.x *= -1;
    }
    if (this.pos.y < this.r) {
      this.direction.y *= -1;
    }
  }

  this.meets = function(board) {
    if (board.pos.y - this.pos.y > 0 && board.pos.y - this.pos.y < this.r && ball.pos.x > board.pos.x && ball.pos.x < board.pos.x + board.r) {
      return true;
    } else {
      return false;
    }
  }

  this.hits = function(brick) {
    var d = dist(this.pos.x, this.pos.y, brick.pos.x, brick.pos.y);
    if (d < brick.r + this.r) {
      return true;
    } else {
      return false;
    }
  }
}
