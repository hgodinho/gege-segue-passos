public void interFace() {
  //console

  if (CONSOLE == true) {
    pushMatrix();
    translate(0, 450);
    pushStyle();
    console.draw(0, 0, width-1, height-451, 14, 13);
    popStyle();
    popMatrix();
  }
  pushMatrix();
  translate(710, 0);
  //acrescentar visual para highfive

  int i = 5;
  int j = i*10;
  //rect
  pushStyle();
  noStroke();
  fill(linha);
  rect(i, i, 80, 10);
  popStyle();

  //tamanho mapa
  pushStyle();
  stroke(180);
  line(0, i, 0, 445);
  fill(50);
  textFont(font2);
  text("tamanho", i, i*5);
  popStyle();
  pushStyle();
  fill(verde);
  textFont(font);
  text(fimx+" X "+fimy, i, i*8);
  popStyle();

  //posicao atual
  pushStyle();
  fill(50);
  textFont(font2);
  text("posição", i, i*11);
  popStyle();

  if (gegeOn == true) {
    ScreenPosition atual = map.getScreenPosition(GEO2);
    pushStyle();
    fill(verde);
    textFont(font);
    text(atual.x+" X "+atual.y, i, i*14);
    popStyle();
  } else {
    pushStyle();
    fill(vermelho);
    textFont(font);
    text("0 X 0", i, i*14);
    popStyle();
  }

  pushStyle();
  stroke(180);
  line(i, i*15, 60, i*15);
  popStyle();
  //GegeOn
  if (gegeOn == false) {
    pushStyle();
    stroke(180);
    line(i, i*15, 60, i*15);
    textFont(font);
    fill(vermelho);
    text("GEGE - off", i, i*19);
    popStyle();
  }
  if (gegeOn == true) {
    pushStyle();
    stroke(180);
    line(i, i*15, 60, i*15);
    textFont(font);
    fill(verde);
    text("GEGE - on", i, i*19);
    popStyle();
  }

  //stream
  pushStyle();
  textFont(font);
  fill(streamcolor);
  text("STREAM", i, i*23);
  popStyle();

  //csv status
  pushStyle();
  textFont(font);
  fill(CSVcolor);
  text("CSV", i, i*27);
  text(linhasCSV, i*6, i*27);
  popStyle();
  pushStyle();
  textFont(font);

  //spacebrew status
  pushStyle();
  textFont(font);
  fill(spacebrewColor);
  text("SPACEBREW", i, i*31);
  popStyle();

  //spacebrew status
  pushStyle();
  textFont(font);
  if (frameRate >= 50) fill(verde);
  if (frameRate < 50 && frameRate >= 30) fill(amarelo);
  if (frameRate < 30) fill(vermelho);
  text("FPS "+int(frameRate), i, i*35);
  popStyle();

  popMatrix();
  //cores para interface
  if (csv == true) CSVcolor = verde;
  else CSVcolor = vermelho;
  if (stream ==true) streamcolor = verde;
  else streamcolor = vermelho;
  if (spacebrewOn ==true) spacebrewColor = verde;
  else spacebrewColor = vermelho;
} 