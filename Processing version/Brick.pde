class Brick {
  PVector pos;
  float r;
  int total;
  color[] colors = {#6CD9CC, #FB6578, #FE5A8F, #FC9574, #9A8DF2};
  color upColor;
  
  Brick() {
    resetPosition();
    r  = random(20, 80);
    total = floor(random(4, 7));
    chooseColor();
  }
  
  void resetPosition() {
    pos = new PVector(random(80, width - 80), random(100, height - 400));
  }
  
  void display() {
    pushStyle();
    pushMatrix();
    noFill();
    strokeWeight(3);
    stroke(upColor);
    translate(this.pos.x, this.pos.y);
    beginShape();
    for (int i = 0; i < this.total; i++) {
      float angle = map(i, 0, this.total, 0, TWO_PI);
      float r = this.r;
      float x = r * cos(angle);
      float y = r * sin(angle);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
    popStyle();
    
  }
  
  //Choose Another color for the blick
  void chooseColor() {
    int temp_index = floor(random(colors.length));
    upColor = colors[temp_index];
  }
}
