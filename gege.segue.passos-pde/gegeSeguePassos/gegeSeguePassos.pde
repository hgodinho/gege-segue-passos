//atualizacoes feitas ao longo do dia 23, 24 de agosto em diante
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.mapdisplay.MapDisplayFactory;
import processing.serial.*;
import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;
import spacebrew.*;
import at.mukprojects.console.*;

//objetos
Serial gege = null;
PFont font;
PFont font2;
PrintWriter log;
PrintWriter logcount;
Console console;
UnfoldingMap map;

//arraylist
ArrayList<Localizacoes> localizacoes = new ArrayList<Localizacoes>();


//strings
//String porta = null;
String porta = Serial.list()[1];
String fim = "gege`s dead baby, gege`s dead...";
String $ = "pos$";
String feed;
String fimx, fimy;
String[] contagem;

//inteiros
int x, y;
int passoX;
int passoY;
int linhaCSV = 0;
int linhasCSV;

//tamanho mapa UNFOLDING
int sizex = 700;
int sizey = 440;

//booleanos
boolean gegeOn = false;
boolean mapaOn = false;
boolean spacebrewOn = false;
boolean stream = false;
boolean highfive = true;
boolean mapaSalvaFrame = false;
boolean setSizeDesenho = false;
boolean mapaAberto = false;
boolean quit = false;
boolean reset = false;
boolean kill = false;
boolean csv = false;
boolean loadCSV = false;
boolean iniciacsv = false;
boolean passodado = false;
boolean CONSOLE = false;

//cores
color linha = color(random(0, 255), random(0, 255), random(0, 255));
color verde = color(10, 198, 74);
color amarelo = color(255, 210, 62);
color vermelho = color(250, 75, 40);
color corTempo = verde;
color h5color = verde;
color streamcolor;
color CSVcolor;
color spacebrewColor;

//tempo
int tempoPassado1 = 0;
int tempoPassado2 = 0;
int verificaGege = 20000;
int highfiveFalse = 20000;

float valueLat;
float valueLong;



Location LOCAL = new Location(-21.774683, -44.969968); // entre minas e sp
Location GEO1;
Location GEO2;

public void settings() {
  size(800, 700, P2D);
}

public void setup() {
  smooth(2);
  olaGege();
  setupMapa(LOCAL, 7, sizex, sizey);

  console = new Console(this);
  console.start();
  CONSOLE = true;

  font = loadFont("AvenirNextCondensed-UltraLight-17.vlw");
  font2 = loadFont("AvenirNextCondensed-Regular-16.vlw");

  runSketch( new String[] { "--display=1", 
    "--location=500,300", 
    "--sketch-path=" + sketchPath(""), 
    "" }, 
    new desenhoCodigo() );

  //setupSpacebrew();
}

public void draw() {
  background(255);

  if (mapaOn == true) { 
    map.draw();
    for (Localizacoes localizacoes : localizacoes) {
      ScreenPosition pos = map.getScreenPosition(localizacoes.location);
      point(pos.x, pos.y);
    }
  }
  //estudar a possibilidade de ser de linhas ao invés de pontos. 
  //por exemplo uma linha entre os pontos 'a' e b'
  //SimpleLinesMarker conexoes = new SimpleLinesMarker(locais);
  //map.addMarker(conexoes);

  interFace();

  //se está recebendo via spacebrew
  if (gegeOn == true && mapaOn == true && spacebrewOn == true && stream == true) desenhaGege();

  //inicia modo csvStream()
  if (gegeOn == true && mapaOn == true && csv == true) csvStream();

  //tempo
  int Agora = millis();
  //CORES PARA TEMPO ATE HIGHFIVE EM DEBUGGEGE
  if (Agora - tempoPassado1 >= int(verificaGege*0.33)) {
    h5color = verde;
  }
  if (Agora - tempoPassado1 >= int(verificaGege*0.66)) {
    h5color = amarelo;
  }
  if (Agora - tempoPassado1 >= verificaGege-1000) {
    h5color = vermelho;
  }

  if (Agora - tempoPassado1 >= verificaGege && gegeOn == true && highfive == true) {
    highfive = false;
    tempoPassado1 = millis();
    tempoPassado2 = millis();
  }
  if (highfive == false) highfive();



  //escuta os comandos de quit, kill e reset
  //if (quit == true) {
  //  int i = int(contagem[0])+1;
  //  save("framesMapa/"+"desenhoCodigo#"+i+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s"+".png");
  //  delay(10);
  //  println("frame QUIT mapa salvo");
  //}
  //if (reset == true) {
  //  pushMatrix();
  //  pushStyle();
  //  textFont(font2, 9);
  //  ScreenPosition atual = map.getScreenPosition(GEO2);
  //  translate(atual.x, atual.y);
  //  rotate(-HALF_PI);
  //  fill(linha);
  //  text("reset"+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second(), 0, 0);
  //  popStyle();
  //  popMatrix();
  //  reset = false;
  //}
  //if (kill == true) {
  //  pushMatrix();
  //  pushStyle();
  //  textFont(font2, 9);
  //  ScreenPosition atual = map.getScreenPosition(GEO2);
  //  translate(atual.x, atual.y);
  //  rotate(-HALF_PI);
  //  fill(linha);
  //  text("kill"+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second(), 0, 0);
  //  popStyle();
  //  popMatrix();
  //  kill = false;
  //}
}



//recebe mensagens do celular via spacebrew
public void onStringMessage( String name, String value ) { //função q executa quando recebe string do servidor
  GEO1.setLat(GEO2.x);
  GEO1.setLon(GEO2.y);
  int s = second();
  int m = minute();
  int h = hour();
  //println("recebido"  + " às: " + h + ":" + m + ":" + s);
  println("local1LAT = " + GEO1.x + " local1LONG = "+ GEO1.y + " às: " + h + ":" + m + ":" + s);
  log.println("local1LAT = " + GEO1.x + " local1LONG = "+ GEO1.y + " às: " + h + ":" + m + ":" + s);
  log.flush();
  if (name.equals("latitude")) {
    valueLat = float(value);
    GEO2.setLat(valueLat);
    // println(valueLat);
  }
  if (name.equals("longitude")) {
    valueLong = float(value);
    GEO2.setLon(valueLong);
    //println(valueLong);
  }
  //println("GEO2LAT = " + GEO2.x + " GEO2LONG = "   + GEO2.y + " às: " + h + ":" + m + ":" + s);
  sb.send("recebido", true);
  stream = true;
}
public void onBooleanMessage(String name, boolean value) {
  if (name.equals("kill") && value == true) {
    log.println(name);
    kill();
  }
  if (name.equals("reset") && value == true) {
    log.println(name);
    reset();
  }
  if (name.equals("quit") && value == true) {
    log.println(name);
    quit();
  }
}






//le mensagens da gege
public void serialEvent(Serial gege) {
  feed = gege.readStringUntil('\r');
  if (feed != null) {
    tempoPassado1 = millis();
    tempoPassado2 = millis();
    //printa log
    println(feed);
    log.println(feed);
    log.flush();
    //debuga valores
    if (feed.contains("gege$")) {
      fimx = feed.substring(12, 16);
      fimy = feed.substring(22, 26);
      gegeOn = true;
      highfive = true;
      if (mapaAberto == false) { 
        setSizeDesenho = true;
      }
    }
    if (feed.contains("h5")) {
      highfive = true;
      h5color = verde;
      //println("highfive");
      log.println("highfive");
      log.flush();
      tempoPassado1 = millis();
      tempoPassado2 = millis();
      delay(100);
    }
    if (feed.contains("cheguei")) passodado = true;
  }
}




//menu
public void keyPressed() {
  if (key == 'c') { //csv interruptor
    csv = !csv;
    loadCSV = true;
    iniciacsv = true;
  }
  if (key == 's') { //STREAM interruptor
    stream = !stream;
  }
  if (key == 'q') { //QUIT 
    log.println("key-q");
    quit();
  }
  if (key == 'k') { //KILL GEGE SERIAL
    log.println("key-k");
    kill();
  }
  if (key == 'r') { //RESETA GEGE
    log.println("key-r");
    reset();
  }
  if (key == 'p') achaGege(); //ACHA PORTA DA GEGE SERIAL
  if (gegeOn == true) {
    if (key == '0') gege.write("z\r"); //ZERA GEGE
    if (key == 'f') gege.write("f\r"); //ACHA FINAL DA GEGE
    if (key == 'z') gege.write("c\r"); //desce CANETA
    if (key == 'a') gege.write("v\r"); //sobe CANETA
    if (keyCode == RIGHT) gege.write("r\r"); //ARRUMAR FUNCAO DE PASSINHOS COM DIRECIONAL AQUI E NO .INO
    if (keyCode == LEFT) gege.write("l\r");
    if (keyCode == UP) gege.write("u\r");
    if (keyCode == DOWN) gege.write("d\r");
  }
}