class TextBox extends Widget {
  boolean focused = true;
  boolean wasPressed = false;

  TextBox(int id, String name, Scene scene) {
    super(id, name, scene);
  }
  
  void input() {
    if (active) {
      if (mouseX>pos.x && mouseX<pos.x+size.x && mouseY>pos.y && mouseY<pos.y+size.y){
        if (mousePressed) // is this button pressed
          focused = true;
      }
      else {
        state = WidgetState.ACTIVE;
        if (mousePressed) focused = false;
      }
    }
    
    if (focused && keyPressed && !wasPressed) {
      if (key == BACKSPACE) {
        if (valueText.length() > 0 ) {
          valueText = valueText.substring( 0 , valueText.length()- 1 );
        }
      }
      else if (key == DELETE)
        valueText = "";
      else {
        valueText = valueText + key;
      }
      
    }
    else state = WidgetState.DISABLED;
    
    wasPressed = focused && keyPressed;
  }
  
  void display() {
    stroke(focused ? hoverColor : backgroundColor);
    switch (state) {
      case ACTIVE: fill(backgroundColor); break; // TODO: fix inconvience here
      case DISABLED: fill(disableColor); break;
      case HOVER: fill(foregroundColor); break;
    }
    rect(pos.x, pos.y, size.x, size.y);
    
    textSize(textSize);
    textAlign(LEFT, CENTER);
    float padding = 3f;
    if (valueText.length() > 0) {
      fill(textColor);
      text(valueText, pos.x+padding, pos.y+padding, size.x-2*padding, size.y-2*padding);
    }
    else {
      fill(hoverColor);
      text(labelText, pos.x+padding, pos.y+padding, size.x-2*padding, size.y-2*padding);
    }
  }
}