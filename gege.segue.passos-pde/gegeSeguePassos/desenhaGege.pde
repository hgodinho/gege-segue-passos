public void desenhaGege() {
  ScreenPosition atual = map.getScreenPosition(GEO2);
  int XMAPA = int(float(fimx))/10;
  int YMAPA = int(float(fimy))/10;
  passoX = round(map(atual.x+5, 0, XMAPA, 0, float(fimx)));
  passoY = round(map(atual.y+5, 0, YMAPA, 0, float(fimy)));
  constrain(passoX, 0, int(fimx));
  constrain(passoY, 0, int(fimy));
  String xis = nf(passoX, 4);
  String yis = nf(passoY, 4);
  //println(passoX+" "+passoY);
  gege.write($+"X"+xis+"Y"+yis+"desc\r");
  println($+"X"+xis+"Y"+yis+"desc\r");
  log.println("passodado");
  log.flush();
  //stream = false;
  //delay(2000);
}