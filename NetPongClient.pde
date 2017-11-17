import processing.net.*;

Client c;

void settings() {
  size(400, 300);
}

void setup() {
  frameRate(60);
  
  SceneManager.addScene("game", new GameScene());
  SceneManager.addScene("wait", new WaitScene());
  SceneManager.addScene("menu", new MenuScene());
  SceneManager.setScene("menu");
}

void keyPressed()  {Controls.setKey(key, keyCode, true);}
void keyReleased() {Controls.setKey(key, keyCode, false);}

Client connectToServer(String ip, int host) {
  return new Client(this, ip, host);
}

void draw() {
  SceneManager.currentScene().loop();
}

void exit() {
  if (c != null)
    c.stop();
  super.exit();
}