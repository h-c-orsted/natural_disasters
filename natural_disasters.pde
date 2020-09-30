DataBroker data = new DataBroker();
ArrayList<InputField> inputs = new ArrayList<InputField>();


void setup() {
  size(1600, 800);
  
  PFont mono = createFont("cour.ttf", 28);
  textFont(mono);
  
  data.loadData();
  println(data.getData("AUSTRIA", 3).deaths);
  inputs.add(new InputField(10,10));
}


void draw() {
  clear();
  background(200);
  for(InputField input : inputs) {
    input.display();
  }
}


void keyPressed() {
  for(InputField input : inputs) input.addIfActive(key);
}

void mousePressed() {
  for(InputField input : inputs) input.mouseClick(mouseX, mouseY);
}
