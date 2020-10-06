DataBroker data = new DataBroker();
InputField countrySearch;
//InputField yearSearch;
ArrayList<InputField> inputs = new ArrayList<InputField>();
Graph g = new Graph(50, 200, 1000, 500);
String country = "AUSTRIA";
//int year;


void setup() {
  size(1600, 800);
  
  PFont mono = createFont("cour.ttf", 28);
  textFont(mono);
  
  data.loadData();
  println(data.getData("AUSTRIA", 3).deaths);

  countrySearch = new InputField(10, 10);
  //yearSearch = new InputField(10, 80);
  inputs.add(countrySearch);
  //inputs.add(yearSearch);
  countrySearch.text = country;
  g.displayRow(data.getAll(country));
}


void draw() {
  clear();
  background(200);
  for(InputField input : inputs) {
    input.display();
  }
  
  g.show();
}


void keyPressed() {
  for(InputField input : inputs) input.addIfActive(key);
  
  if (key == ENTER) {
    country = countrySearch.text.toUpperCase();
    g.displayRow(data.getAll(country));
    //year = int(yearSearch.text);
    for(InputField input : inputs) input.isActive = false;
  }
}

void mousePressed() {
  for(InputField input : inputs) input.mouseClick(mouseX, mouseY);
}
