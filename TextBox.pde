class TextBox extends Widget {
  boolean focused = true;
  boolean wasPressed = false;
  boolean multpleLines;

  TextBox(int id, String name, Scene scene, boolean multpleLines) {
    super(id, name, scene);
    this.multpleLines = multpleLines;
  }
  
  void input() {
    if (active) {
      if (mouseX>pos.x && mouseX<pos.x+size.x && mouseY>pos.y && mouseY<pos.y+size.y){
        if (mousePressed) // is this button pressed
          focused = true;
      }
      else {
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
      else if (multpleLines || !(key == TAB || key == RETURN || key == ENTER)){
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
    textAlign(LEFT, TOP);
    float padding = 5f;
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