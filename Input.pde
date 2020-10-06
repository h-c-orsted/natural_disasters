
class InputField {
  int x, y;
  int w = 300, h = 50; 
  boolean isActive;
  boolean enterPressed = false;
  String text = "";
  float padding = 8;
  
  InputField(int x_in, int y_in) {
    x = x_in;
    y = y_in;
  }
  
  InputField(int x_in, int y_in, int w_in, int h_in) {
    x = x_in;
    y = y_in;
    w = w_in;
    h = h_in;
  }
  
  void display() {
    fill(255); 
    rect(x, y, w, h);
    fill(0);
    textSize(28);
    text(text, x+padding, y+padding, w-padding*2, h-padding*2);
    
    if (millis() % 1060 < 530 && isActive) {
      float cursor_x_pos = textWidth(text);
      fill(0);
      rect(cursor_x_pos+x+10, y+10, 2, 28);
    }
  }
  
  void addIfActive(char t) {
    if (isActive) {
      if (key == BACKSPACE) {
        // If there is any letters, remove one
        if (text.length()-1 > -1) text = text.substring(0, text.length()-1);
      } else if (key == CODED || key == ENTER) {
        // Do nothing. The key is a modifier like ctrl or shift
      } else {
        text += t;
      }
    }
  }
  
  void mouseClick(int x_mouse, int y_mouse) {
    isActive = Collision.pointIsInsideBox(x_mouse,y_mouse,x,y,w,h);
  }
}
