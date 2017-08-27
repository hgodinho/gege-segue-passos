public class desenhoCodigo extends PApplet {
  public void settings() {
    size(200, 200);
  }
  public void setup() {
    surface.setResizable(true);
    strokeWeight(3);
    font2 = loadFont("Avenir-Book-9.vlw");
  }

  public void draw() {
    if (setSizeDesenho == true) {
      int XMAPA = int(float(fimx))/10;
      int YMAPA = int(float(fimy))/10;
      surface.setSize(XMAPA, YMAPA);
      println("Tamanho mapa X."+XMAPA+" Y."+YMAPA);
      log.println("Tamanho mapa X."+fimx+" Y."+fimy);
      log.flush();
      delay(10);
      setSizeDesenho = false;
      mapaAberto = true;
    }

    if (stream == true) {
      ScreenPosition antes2 = map.getScreenPosition(GEO1);
      ScreenPosition atual2 = map.getScreenPosition(GEO2);
      stroke(linha);
      line(antes2.x+5, antes2.y+5, atual2.x+5, atual2.y+5);
    }

    int i = int(contagem[0])+1;
    if (quit == true) {
      save("framesMapa/"+"desenhoCodigo#"+i+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s"+".png");
      println("frame QUIT mapa salvo");
    }

    if (reset == true) {
      pushMatrix();
      pushStyle();
      textFont(font2, 9);
      ScreenPosition atual = map.getScreenPosition(GEO2);
      translate(atual.x, atual.y);
      rotate(-HALF_PI);
      fill(linha);
      text("reset"+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second(), 0, 0);
      popStyle();
      popMatrix();
      reset = false;
    }
    if (kill == true) {
      pushMatrix();
      pushStyle();
      textFont(font2, 9);
      ScreenPosition atual = map.getScreenPosition(GEO2);
      translate(atual.x, atual.y);
      rotate(-HALF_PI);
      fill(linha);
      text("kill"+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second(), 0, 0);
      popStyle();
      popMatrix();
      kill = false;
    }
  }
}