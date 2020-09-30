
class DataBroker {
  Table table;
  int rowCount, columnCount;
  TableRow headers;
  
  
  DataBroker() {
    
  }
  
  void loadData() {
    // Load csv-file into table object
    table = loadTable("deaths-natural-disasters.csv");
    rowCount = table.getRowCount();
    columnCount = table.getColumnCount();
    headers = table.getRow(0);
    if (rowCount > 1 && columnCount > 1) println("Loaded data successfully");   // Print success if greater then 1 as failure in data will result in 1 row or 1 column
  }
  
  
  void putData(String key1, int key2, Data d) {
    table.setInt(getRowFromKey(key1), key2, d.deaths);
  }
  
  
  Data getData(String key1, int key2) {
    TableRow row = table.getRow(getRowFromKey(key1));
    return new Data(row.getString(1), headers.getInt(key2), row.getInt(key2));
  }
  
  
  ArrayList getAll(String key1) {
    ArrayList<Data> list = new ArrayList<Data>();
    TableRow row = table.getRow(getRowFromKey(key1));
    for (int i=2; i<columnCount-2; i++) {
      list.add(new Data(key1, headers.getInt(i), row.getInt(i)));
    }
    return list;
  }
  
  
  int getRowFromKey(String key1) {
    println("Get from " + key1);
    int rowNr = 0;
    for (int i=1; i<rowCount-1; i++) {  // Start at row 1 as row 0 is headers
      TableRow row = table.getRow(i);
      //println(row.getString(1));
      if (key1.equals(row.getString(1))) {
        rowNr = i;
        break;
      }
    }
    if (rowNr == 0) println("Didn't find row with key 1: '" + key1 + "'");
    return rowNr;
  }
}



class Data {
  String country;
  int year, deaths;
  
  Data(String c, int y, int d) {
    country = c;
    year = y; 
    deaths = d;
  }
}
