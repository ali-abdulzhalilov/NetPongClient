class Button extends Widget{
  boolean wasPressed = false;
  ButtonState state = ButtonState.IDLE;
  
  Button(int id, String name, Scene scene) {
    super(id, name, scene);
  }
  
  void input() {
    if (mouseX>pos.x && mouseX<pos.x+size.x && mouseY>pos.y && mouseY<pos.y+size.y){ // if mouse over this button
      if (mousePressed && !wasPressed) { // is this button pressed
        state = ButtonState.PRESSED;
        scene.widgetEvent(new Event(this));
      } else state = ButtonState.HOVER;
      
      wasPressed = mousePressed;
    }
    else state = ButtonState.IDLE;
  }
  
  void display() {
    noStroke();
    switch (state) {
      case IDLE: fill(backgroundColor); break;
      case HOVER: fill(foregroundColor); break;
      case PRESSED: fill(activeColor); break;
    }
    rect(pos.x, pos.y, size.x, size.y);
    
    fill(textColor);
    textAlign(CENTER,CENTER);
    textSize(textSize);
    //text(label, pos.x+size.x/2, pos.y+size.y/2);
    text(label, pos.x, pos.y, size.x, size.y);
  }
  
  Button setPos(float x, float y) {
    pos.x = x;
    pos.y = y;
    return this;
  }
}

enum ButtonState {
  IDLE,
  HOVER,
  PRESSED
}