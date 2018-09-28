class Ball {
  PVector loc;
  PVector speed;
  int r = 15;
  ArrayList<PVector> shadow;

  Ball() {
    loc = new PVector(width/2, height/2);
    speed = new PVector(6, 6);
    shadow = new ArrayList<PVector>();
  }

  void display() {
    pushStyle();
    //Make a trail of the ball
    for(int i = 0; i < shadow.size(); i++) {
      noStroke();
      fill(#CCC7F2);
      PVector temp_Shadow = shadow.get(i);
      ellipse(temp_Shadow.x, temp_Shadow.y, 25, 25);
    }
    popStyle();
    pushStyle();
    stroke(0);
    strokeWeight(1);
    fill(#9A8DF2);
    ellipse(loc.x, loc.y, r*2, r*2);
    ellipse(loc.x, loc.y, r / 2 * 3, r / 2 * 3);
    ellipse(loc.x, loc.y, r, r);
    ellipse(loc.x, loc.y, r / 2, r / 2);
    popStyle();
  }

  void update() {
    loc.add(speed);
    
    shadow.add(loc.copy());
    
    //defines how many shadows will be displayed
    if(shadow.size() > 3) {
      shadow.remove(0);
    }
  }
  
  //Check if the Ball hits the paddle
  boolean meets(Paddle paddle) {
    if(loc.y < paddle.loc.y &&
       loc.y > paddle.loc.y - r &&
       loc.x > paddle.loc.x - r &&
       loc.x < paddle.loc.x + paddle.w + r) {
      return true;
    } else {
      return false;
    }
  }
  
  //Check if the Ball hits the edges of the screen
  void checkEdges() {
    /*
    if(loc.y < r && dir.y < 0 ) {
     dir.y *= -1;
     }
     else if(loc.y > height - r && dir.y > 0) {
     dir.y *= -1;
     }
     else if(loc.x < r && dir.x < 0 ) {
     dir.x *= -1;
     }
     else if(loc.x > width - r && dir.x > 0) {
     dir.x *= -1;
     }
     */
    if (loc.x + r > width || loc.x - r < 0) {
      speed.x *= -1;
    } else if (loc.y - r < 0) {
      speed.y *= -1;
    }
  }
  
  //If the ball pass trough the paddle
  //player lose
  boolean lose() {
    if(loc.y > height + 10) {
      loc.x = width/2;
      loc.y = height/2;
      speed.x *= -1;
      return true;
    }else {
      return false;
    }
  } 
  
  //Check if the Ball hits the Block
  boolean hitsBlock(Block block) {
    float testX = loc.x;
    float testY = loc.y;
    
    if(loc.x < block.loc.x)  testX = block.loc.x;
    else if(loc.x > block.loc.x + block.w) testX = block.loc.x + block.w;
    if(loc.y < block.loc.y) testY = block.loc.y;
    else if(loc.y > block.loc.y + block.h) testY = block.loc.y + block.h;
    
    float distX = loc.x - testX;
    float distY = loc.y - testY;
    float disttance = sqrt((distX*distX) + (distY*distY));
    
    if(disttance <= r) {
      return true;
    }else {
      return false;
    }
  }
  
  
  //Check if the Ball hits the Brick
  boolean hits (Brick brick) {
    float d = dist(loc.x, loc.y, brick.pos.x, brick.pos.y);
    if (d < brick.r + this.r) {
      return true;
    } else {
      return false;
    }
  }
}
