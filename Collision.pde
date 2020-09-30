
static class Collision {
  
  static boolean valueInRange(float val, float min, float max) {
    return (val >= min) && (val <= max);
  }
  
  static boolean pointIsInsideBox(float x1, float y1, float x2, float y2, float w2, float h2) {
    return valueInRange(x1, x2, w2) && valueInRange(y1, y2, h2);
  }
  
  static boolean pointIsInsideCircle(float x1, float y1, float x2, float y2, float r) {
    PVector point = new PVector(x1, y1);
    PVector circle = new PVector(x2, y2);
    return point.dist(circle) <= r;
  }
}
