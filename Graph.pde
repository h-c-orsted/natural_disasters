class GraphPoint {
  float speed = 10;
  float x, y, y_end;
  float r;
  
  GraphPoint(float x, float y, float r, float y_end) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.y_end = y_end;
  }
  
  void show() {
    if (y > y_end) {
      // The dot is lower than it should be
      y -= speed;
    }
    circle(x, y, r);
  }
}



class Graph {
  float x, y, w, h;
  float point_padding = 1;
  ArrayList<GraphPoint> points = new ArrayList<GraphPoint>();
  
  
  Graph (float x_in, float y_in, float w_in, float h_in) {
    x = x_in;
    y = y_in;
    w = w_in;
    h = h_in;
  }
  
  
  void displayRow (ArrayList<Data> data_row) {    
    // Clear array of points in order to create new
    points.clear();
    
    int count_data = data_row.size();
    // Start by finding max value for scaling y-axis
    float max_val = 0;
    for (Data d : data_row) if (d.deaths > max_val) max_val = d.deaths;
    
    // Find the width (in ox) of one year on the graph
    float year_width = w/count_data;
    
    // Now display data
    fill(255);
    for (int i=0; i<data_row.size(); i++) {
      Data d = data_row.get(i);
      // Calculate position of this point
      float point_x = x + year_width*i + 1;
      float point_y = y + h - h/d.deaths;
      // If y is 0 (or not failing by dividing by 0), then show point at bottom of screen
      point_y = point_y > 0 ? point_y : y+h;
      
      // Display circle at point
      //circle(point_x, point_y, year_width-2);
      points.add(new GraphPoint(point_x, y+h, year_width-2, point_y));
    }
  }
  
  
  void show() {
    // Setup lines and stuff
    graphLayout();
    
    for (GraphPoint p : points) {
      p.show();
    }
  }
  
  
  void graphLayout () {
    fill(0);
    rect(x, y, 2, h);
    rect(x, y+h, w, 2);
  }
}
