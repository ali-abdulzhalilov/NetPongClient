static class SceneManager {
  static HashMap<String, Scene> scenes = new HashMap<String, Scene>();
  static String currentSceneName;
  
  static Scene currentScene() {
    return scenes.containsKey(currentSceneName) ? scenes.get(currentSceneName) : null;
  }
  
  static void addScene(String name, Scene scene) {
    scenes.put(name, scene);
  }
  
  static void setScene(String sceneName) {
    if (scenes.containsKey(sceneName)) {
      if (scenes.containsKey(currentSceneName))
        currentScene().onExit();
      currentSceneName = sceneName;
      currentScene().onEnter();
    } else
      println("scene " + sceneName + " is not found");
  }
}