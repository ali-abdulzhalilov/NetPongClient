abstract class Widget {
  int id;
  String name;
  Scene scene;
  boolean active = true;
  WidgetState state = WidgetState.ACTIVE;
  
  PVector pos;
  PVector size;
  String labelText;
  String valueText = "";
  
  int textSize = 10;
  color backgroundColor = color(50);
  color foregroundColor = color(100);
  color activeColor = color(200);
  color disableColor = color(25);
  color hoverColor = color(150);
  color textColor = color(255);
  
  Widget(int id, String name, Scene scene) {
    this.id = id;
    this.name = name;
    this.scene = scene;
    this.pos = new PVector(0, 0);
    this.size = new PVector(50, 50);
    this.labelText = name;
  }
  
  abstract void input();
  abstract void display();
  
  Widget setPos(float x, float y) {
    pos.x = x;
    pos.y = y;
    return this;
  }
  
  Widget setSize(float w, float h) {
    size.x = w;
    size.y = h;
    return this;
  }
  
  Widget setLabel(String newLabel) {
    labelText = newLabel;
    return this;
  }
  
  Widget setText(String newText) {
    valueText = newText;
    return this;
  }
  
  Widget setActive(boolean newValue) {
    active = newValue;
    return this;
  }
}

class Event {
  Widget sender;
  
  Event(Widget sender) {
    this.sender = sender;
  }
}

enum WidgetState {
  ACTIVE,
  DISABLED,
  HOVER,
  PRESSED
}