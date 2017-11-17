class MenuScene extends Scene {
  Button[] bs;
  WidgetManager wm;
  
  MenuScene() {
    wm = new WidgetManager(this);
    wm.setTextSize(15);
    
    wm.addButton("PlayButton")
      .setPos(width/2-75, 180)
      .setSize(150, 29)
      .setLabel("PLAY");
      
    wm.addButton("OptionButton")
      .setPos(width/2-75, 210)
      .setSize(150, 29)
      .setLabel("OPTIONS");
    
    wm.addButton("QuitButton")
      .setPos(width/2-75, 240)
      .setSize(150, 29)
      .setLabel("QUIT");
  }
  
  void widgetEvent(Event e) {
    if (e.sender == wm.getByName("PlayButton")) {
      c = connectToServer("127.0.0.1", 12345);
      if (c != null && c.active()) {
        SceneManager.setScene("wait");
      } else {
        println("can't connect to server");
      }
    }
    
    if (e.sender == wm.getByName("QuitButton")) {
      exit();
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