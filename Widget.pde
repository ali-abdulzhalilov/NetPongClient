abstract class Widget {
  int id;
  String name;
  Scene scene;
  
  PVector pos;
  PVector size;
  String label;
  
  int textSize = 10;
  color backgroundColor = color(50);
  color foregroundColor = color(100);
  color activeColor = color(200);
  color textColor = color(255);
  
  Widget(int id, String name, Scene scene) {
    this.id = id;
    this.name = name;
    this.scene = scene;
    this.pos = new PVector(0, 0);
    this.size = new PVector(50, 50);
    this.label = name;
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
    label = newLabel;
    return this;
  }
}

class Event {
  Widget sender;
  
  Event(Widget sender) {
    this.sender = sender;
  }
}