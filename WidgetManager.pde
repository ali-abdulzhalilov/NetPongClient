class WidgetManager extends Widget {
  ArrayList<Widget> widgets;
  int lastId = 0;
  
  WidgetManager(Scene scene) {
    super(0, "manager", scene);
    widgets = new ArrayList<Widget>();
    this.scene = scene;
  }
  
  void input() {
    for (int i = 0; i < widgets.size(); i++) {
      Widget widget = widgets.get(i);
      widget.input();
    }
  }
  
  void display() {
    for (int i = 0; i < widgets.size(); i++) {
      Widget widget = widgets.get(i);
      widget.display();
    }
  }
  
  // -- add some new widget --
  Button addButton(String name) {
    lastId++;
    Button newButton = new Button(lastId, name, scene);
    addAndInherit(newButton);
    return newButton;
  }
  
  TextBox addTextBox(String name, boolean multpleLines) {
    lastId++;
    TextBox newTextBox = new TextBox(lastId, name, scene, multpleLines);
    addAndInherit(newTextBox);
    return newTextBox;
  }
  
  void addAndInherit(Widget widget) {
    widgets.add(widget);
    widget.textSize = textSize;
    widget.backgroundColor = backgroundColor;
    widget.foregroundColor = foregroundColor;
    widget.activeColor = activeColor;
    widget.textColor = textColor;
  }
  
  // -- get widget by id/name --
  Widget getById(int id) {
    for (int i = 0; i < widgets.size(); i++) {
      Widget widget = widgets.get(i);
      if (widget.id == id)
        return widget;
    }
    return null;
  }
  
  Widget getByName(String name) {
    for (int i = 0; i < widgets.size(); i++) {
      Widget widget = widgets.get(i);
      if (widget.name == name)
        return widget;
    }
    return null;
  }
  
  // -- set some value to some field --
  Widget setTextSize(int textSize) {
    this.textSize = textSize;
    return this;
  }
  
  Widget setBackgroundColor(color newColor) {
    backgroundColor = newColor;
    return this;
  }
  
  Widget setForegroundColor(color newColor) {
    foregroundColor = newColor;
    return this;
  }
  
  Widget setActiveColor(color newColor) {
    activeColor = newColor;
    return this;
  }
  
  Widget setDisableColor(color newColor) {
    disableColor = newColor;
    return this;
  }
  
  Widget setHoverColor(color newColor) {
    hoverColor = newColor;
    return this;
  }
  
  Widget setTextColor(color newColor) {
    textColor = newColor;
    return this;
  }
}