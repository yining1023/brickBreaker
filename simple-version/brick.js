function Brick(pos, r) {
  if (pos) {
    this.pos = pos.copy();
  } else {
    this.pos = createVector(random(100, width - 100), random(100, height - 400));
  }
  if (r) {
    this.r = r * 0.5;
  } else {
    this.r = random(20, 80);
  }

  this.total = 6;

  this.display = function() {
    push();
    translate(this.pos.x, this.pos.y);
    beginShape();
    for (var i = 0; i < this.total; i++) {
      var angle = map(i, 0, this.total, 0, TWO_PI);
      var r = this.r;
      var x = r * cos(angle);
      var y = r * sin(angle);
      vertex(x, y);
    }
    endShape(CLOSE);
    pop();
  }

  this.shrink = function() {
    var newB = [];
    newB[0] = new Brick(this.pos, this.r);
    return newB;
  }

}
