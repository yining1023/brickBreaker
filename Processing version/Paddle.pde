class Paddle {
  int w = 160;
  int h = 20;
  PVector loc;
  boolean isMovingRight;
  boolean isMovingLeft;
  
  Paddle() {
    loc = new PVector(width/2, height - h*2);
    isMovingRight = false;
    isMovingLeft = false;  
  }
  
  void display() {
    pushStyle();
    fill(204, 255, 255);
    stroke(#9A8DF2);
    strokeWeight(2);
    rect(loc.x, loc.y, w, h);
    for (int i = 0; i < this.w; i += this.h) {
      line(this.loc.x + i, this.loc.y, this.loc.x + this.h + i, this.loc.y + this.h);
    }
    popStyle();
  }
  
  void update() {
    if(isMovingRight) {
      mover(20);
    }else if (isMovingLeft) {
      mover(-20);
    }
  }
  
  void mover(float step) {
    loc.x += step;
    loc.x = constrain(loc.x, 0 , width - w);
  }
}
