Table csvTable;

public void csvStream() {
  csvTable = loadTable("final.csv", "header");
  linhasCSV = csvTable.getRowCount();
  if (loadCSV == true) {
    for (TableRow todas : csvTable.rows()) { 

      Localizacoes locais = new Localizacoes();
      float lat = todas.getFloat("Latitude");
      float lon = todas.getFloat("Longitude");

      locais.location = new Location(lat, lon);

      localizacoes.add(locais);
    }
    loadCSV = false;
    delay(1);
  }

  TableRow inicio = csvTable.getRow(0);

  if (iniciacsv == true) {
    GEO1.setLon(inicio.getFloat("Longitude"));
    GEO1.setLat(inicio.getFloat("Latitude"));

    ScreenPosition comeco = map.getScreenPosition(GEO1);
    int XMAPA = int(float(fimx))/10;
    int YMAPA = int(float(fimy))/10;
    passoX = round(map(comeco.x, 0, XMAPA, 0, float(fimx)));
    passoY = round(map(comeco.y, 0, YMAPA, 0, float(fimy)));

    constrain(passoX, 0, int(fimx));
    constrain(passoY, 0, int(fimy));
    String xis = nf(passoX, 4);
    String yis = nf(passoY, 4);
    println(passoX+" "+passoY);
    gege.write($+"X"+xis+"Y"+yis+"sobe\r");
    iniciacsv = false;
  }

  //println("pronta para começar");
  if (stream == true) {
    highfive = true;
    //println(csvTable.getRowCount());
    if (passodado == true) {
      TableRow row = csvTable.getRow(linhaCSV);
      GEO1.setLat(GEO2.x);
      GEO1.setLon(GEO2.y);
      GEO2.setLon(row.getFloat("Longitude"));
      GEO2.setLat(row.getFloat("Latitude"));

      ScreenPosition atual = map.getScreenPosition(GEO2);
      int XMAPA = int(float(fimx))/10;
      int YMAPA = int(float(fimy))/10;
      passoX = round(map(atual.x, 0, XMAPA, 0, float(fimx)));
      passoY = round(map(atual.y, 0, YMAPA, 0, float(fimy)));
      constrain(passoX, 0, int(fimx));
      constrain(passoY, 0, int(fimy));
      String xis = nf(passoX, 4);
      String yis = nf(passoY, 4);
      gege.write($+"X"+xis+"Y"+yis+"desc\r");
      linhaCSV++;
      println("linhaCSV: "+linhaCSV);
      passodado = false;
    }
    if (linhaCSV >= csvTable.getRowCount()) {
      csv = false;
      stream = false;
    }
    //for loop de iteração entre as linhas da tabela, funciona melhor que o de baixo, mas ainda sim perde passos.
    //for (TableRow row : csvTable.rows()) {
    //  GEO1.setLat(GEO2.x);
    //  GEO1.setLon(GEO2.y);
    //  GEO2.setLon(row.getFloat("Longitude"));
    //  GEO2.setLat(row.getFloat("Latitude"));
    //  ScreenPosition atual = map.getScreenPosition(GEO2);
    //  passoX = round(map(atual.x, 0, width, 0, float(fimx)));
    //  passoY = round(map(atual.y, 0, height, 0, float(fimy)));
    //  constrain(passoX, 0, int(fimx));
    //  constrain(passoY, 0, int(fimy));
    //  String xis = nf(passoX, 4);
    //  String yis = nf(passoY, 4);
    //  //println(passoX+" "+passoY);
    //  gege.write($+"X"+xis+"Y"+yis+"desc\r");
    //  delay(1000);
    //  //println(GEO2);
    //}

    //for loop, funciona, mas perde passos
    //for (int i = 0; i <= csvTable.getRowCount()-1; i ++) {
    //  TableRow row = csvTable.getRow(i);
    //  GEO1.setLat(GEO2.x);
    //  GEO1.setLon(GEO2.y);
    //  GEO2.setLon(row.getFloat("Longitude"));
    //  GEO2.setLat(row.getFloat("Latitude"));
    //  delay(2000);
    //  //println(GEO2);
    //}

    //csv = false;
  }
}