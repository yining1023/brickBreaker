class Block {
  PVector loc;
  int w = floor(random(30, 60));
  int h = floor(random(8, 15));
  
  Block() {
    loc = new PVector(random(100, width - 100), random(height/2 - 50, height/2));
    level();
  }
  
  void show() {
    pushStyle();
    fill(#FAD2BB);
    stroke(140, 94, 34);
    strokeWeight(2);
    rect(loc.x, loc.y, w, h);
    for (int i = 0; i < w - h; i += this.h + 2) {
      line(loc.x + i, loc.y, loc.x + h + i, loc.y + h);
    }
    popStyle();  
  }
  
  //modifies the size of the block according to the level
  void level() {
    w += lvl + floor(random(1, 5));
    h += lvl + floor(random(1, 3));
  }
}
