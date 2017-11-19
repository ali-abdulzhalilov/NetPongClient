class MenuScene extends Scene {
  Button[] bs;
  WidgetManager wm;
  
  MenuScene() {
    wm = new WidgetManager(this);
    wm.setTextSize(15);
    
    wm.addTextBox("ServerIpTextBox", true)
      .setLabel("Write server ip here")
      .setText("127.0.0.1")
      .setPos(50, 180)
      .setSize(199, 29);
    
    wm.addButton("PlayButton")
      .setPos(250, 180)
      .setSize(100, 29)
      .setLabel("CONNECT");
  }
  
  void widgetEvent(Event e) {
    if (e.sender == wm.getByName("PlayButton")) {
      String serverIp = wm.getByName("ServerIpTextBox").valueText;
      c = connectToServer(serverIp, 12345);
      if (c != null && c.active()) {
        SceneManager.setScene("wait");
      } else {
        println("can't connect to server");
      }
    }
  }
  
  void handleInput() {
    wm.input();
  };
  
  void update() {};
  
  void render() {
    background(0);
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(64);
    text("Pong", width/2, 80);
    textSize(12);
    text("I almost did it", width/2, 120);
    
    wm.display();
  };
}