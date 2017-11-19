import processing.net.*;

class GameScene extends Scene {
  PVector pPos1, pPos2;
  PVector pSize;
  PVector bPos;
  float bSize;
  int pScore1, pScore2;
  boolean bump = false;
  
  GameScene() {
    pPos1 = new PVector();
    pPos2 = new PVector();
    pSize = new PVector(10, 100);
    bPos = new PVector();
    bSize = 10;
  }
  
  void handleInput() {
    float inX = 0, inY = 0;
    
    if (Controls.keys[UP]) inY += -1;
    if (Controls.keys[DOWN]) inY += 1;
    if (Controls.keys[LEFT]) inX += -1;
    if (Controls.keys[RIGHT]) inX += 1;
    
    c.write(inX + " " + inY + "\n");
    
    if (Controls.keys[' ']) SceneManager.setScene("wait");
    
    if (c.available() > 0) {
      String input = c.readString();
      if (input.contains("\n")) {
        input = input.substring(0, input.indexOf("\n"));
        String[] data = split(input, ' ');
        if (data.length >= 8) {
          pPos1.x = float(data[0]);
          pPos1.y = float(data[1]);
          pPos2.x = float(data[2]);
          pPos2.y = float(data[3]);
          bPos.x = float(data[4]);
          bPos.y = float(data[5]);
          pScore1 = int(data[6]);
          pScore2 = int(data[7]);
        }
        else if (data.length >= 3) {
          if (data[0].contains("WAIT")) {
            SceneManager.setScene("wait");
          }
        }
      }
    }
  }
  
  void update() {
    if (!c.active()) SceneManager.setScene("menu");
    
    if (bPos.y-10 <= 0 || bPos.y+10 >= height)
      bump = true;
  }
  
  void render() {
    background(bump?255:0);
    bump = false;
    
    fill(255);
    noStroke();
    rect(pPos1.x, pPos1.y, pSize.x, pSize.y);
    rect(pPos2.x, pPos2.y, pSize.x, pSize.y);
    ellipse(bPos.x, bPos.y, bSize, bSize);
    
    fill(255);
    textSize(30);
    textAlign(RIGHT);
    text(pScore1, width/2-20, 30);
    textAlign(LEFT);
    text(pScore2, width/2+20, 30);
  }
}