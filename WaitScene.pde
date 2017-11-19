class WaitScene extends Scene {
  WidgetManager wm;
  boolean p1IsReady;
  boolean p2IsReady;
  color readyColor = color(0, 255, 0);
  color notReadyColor = color(255, 0, 0);
  
  void enter() {
    p1IsReady = false;
    p2IsReady = false;
  }
  
  WaitScene() {
    wm = new WidgetManager(this);
    wm.setTextSize(15);
    
    wm.addButton("CancelButton")
      .setPos(width/2-75, 210)
      .setSize(150, 29)
      .setLabel("CANCEL");
  }
  
  void widgetEvent(Event e) {
    if (e.sender == wm.getByName("CancelButton")) {
      SceneManager.setScene("menu");
    }
  }
  
  void handleInput() {
    if (c.available() > 0) {
      String input = c.readString();
      if (input.contains("\n")) {
        input = input.substring(0, input.indexOf("\n"));
        String[] data = split(input, ' ');
        if (data.length >= 3) {
          if (data[0].contains("WAIT")) {
            if (data[1].contains("NOT_READY"))
              p1IsReady = false;
            else if (data[1].contains("READY"))
              p1IsReady = true;
            
            if (data[2].contains("NOT_READY"))
              p2IsReady = false;
            else if (data[2].contains("READY"))
              p2IsReady = true;
          }
        }
      }
    }
    
    wm.input();
  };
  
  void update() {
    if (!c.active()) SceneManager.setScene("menu");
    
    if (p1IsReady && p2IsReady)
      SceneManager.setScene("game");
  };
  
  void render() {
    background(0);
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(15);
    text("Player 1", 100, 100);
    text("Player 2", 300, 100);
    fill(p1IsReady?readyColor:notReadyColor);
    text(p1IsReady?"Ready":"Not ready", 100, 115);
    fill(p2IsReady?readyColor:notReadyColor);
    text(p2IsReady?"Ready":"Not ready", 300, 115);
    
    wm.display();
  };
}