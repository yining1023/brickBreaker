class GameSystem {
  String loseGame = "You Lose"; //Message of player win
  String winGame = "You Win"; //Message of player lose
  
  GameSystem() {
    
  }
  //Display how to play the game
  void displayHtp() {
    pushStyle();
    stroke(0);
    strokeWeight(3);
    fill(250);
    rect(width/2 - 150, 100, 300, 400);
    textLeading(26);
    textAlign(RIGHT, BASELINE);
    textSize(20);
    fill(0);
    text("A key:", 390, 180);
    text("D key:", 390, 250);
    textAlign(LEFT);
    textSize(15);
    fill(100);
    text("Move Left", 400, 180);
    text("Move Right", 400, 250);
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text("Objective:", 400, 345);
    textSize(15);
    fill(100);
    text("Destroy all bricks by deflecting", 400, 375);
    text("the ball with the paddle", 400, 405);
    textSize(19);
    fill(0);
    text("- S key to start -", 400, 470);
    popStyle();
  }
  
  //Display Score
  void displayScore() {
    pushStyle();
    textSize(15);
    fill(#D02BED);
    text("Level: " + lvl + "      Score: " + score, width/2 - 60, 20);
    popStyle();
  }
  
  //Display Win message and how to start again
  void winMsg() {
    noLoop();
    pushStyle();
    fill(#BE33D6);
    textSize(50);
    text(winGame, width/2-100, height/2);
    textSize(15);
    fill(#53145E);
    text("S key to restart the game.", width/2-80, height/2 + 30);
    popStyle();
  }
  
  //Display Lose message and how to
  //continue the game
  void loseMsg() {
    noLoop();
    pushStyle();
    fill(#BE33D6);
    textSize(50);
    text(loseGame, width/2-100, height/2);
    textSize(15);
    fill(#53145E);
    text("S key to continue the game.", width/2-80, height/2 + 30);
    popStyle();    
  }
  
}
