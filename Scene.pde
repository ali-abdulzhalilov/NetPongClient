abstract class Scene {
  void loop() {
    handleInput();
    update();
    render();
  }
  
  void onEnter() {}
  void widgetEvent(Event e) {}
  abstract void handleInput();
  abstract void update();
  abstract void render();
  void onExit() {}
}