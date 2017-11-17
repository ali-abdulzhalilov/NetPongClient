static class Controls {
  static boolean[] keys = new boolean[255];
  
  static void setKey(int k, int kCode, boolean value) {
    
    if (k == CODED)
        keys[kCode] = value;
    else
      if (k < 255)
        keys[k] = value;
  }
}