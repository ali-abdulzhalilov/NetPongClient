import processing.net.*;

class GameScene extends Scene {
  PVector pPos1, pPos2;
  PVector pSize;
  PVector bPos;
  float bSize;
  
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
        if (data.length >= 6) {
          pPos1.x = float(data[0]);
          pPos1.y = float(data[1]);
          pPos2.x = float(data[2]);
          pPos2.y = float(data[3]);
          bPos.x = float(data[4]);
          bPos.y = float(data[5]);
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
  }
  
  void render() {
    background(0);
    
    fill(255);
    noStroke();
    rect(pPos1.x, pPos1.y, pSize.x, pSize.y);
    rect(pPos2.x, pPos2.y, pSize.x, pSize.y);
    ellipse(bPos.x, bPos.y, bSize, bSize);
  }
}