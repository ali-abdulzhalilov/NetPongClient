class Button extends Widget{
  boolean wasPressed = false;
  
  Button(int id, String name, Scene scene) {
    super(id, name, scene);
  }
  
  void input() {
    if (active) {
      if (mouseX>pos.x && mouseX<pos.x+size.x && mouseY>pos.y && mouseY<pos.y+size.y){ // if mouse over this button
        if (mousePressed && !wasPressed) { // is this button pressed
          state = WidgetState.PRESSED;
          scene.widgetEvent(new Event(this));
        } else state = WidgetState.HOVER;
        
        wasPressed = mousePressed;
      }
      else state = WidgetState.ACTIVE;
    }
    else state = WidgetState.DISABLED;
  }
  
  void display() {
    noStroke();
    switch (state) {
      case ACTIVE: fill(backgroundColor); break; // TODO: fix inconvience here
      case DISABLED: fill(disableColor); break;
      case HOVER: fill(hoverColor); break;
      case PRESSED: fill(activeColor); break; // and here
    }
    rect(pos.x, pos.y, size.x, size.y);
    
    fill(textColor);
    textAlign(CENTER,CENTER);
    textSize(textSize);
    //text(label, pos.x+size.x/2, pos.y+size.y/2);
    text(labelText, pos.x, pos.y, size.x, size.y);
  }
}