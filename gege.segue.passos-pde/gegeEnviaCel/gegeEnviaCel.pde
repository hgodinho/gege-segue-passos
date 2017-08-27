//APIs
import spacebrew.*;
import ketai.sensors.*;
import android.content.Context;

//objetos
KetaiLocation location;
Spacebrew sb;
Context context;

//variaveis
double longitude, latitude, altitude;
float longi, lati, alti;
int hspace, mspace, sspace;
int hlocal, mlocal, slocal;

//strings
String latView, longView, altView;
String longINT, latINT, altINT;
String server="gertrudes.herokuapp.com/index.html?server=gertrudes.herokuapp.com&port=80"; // sandbox.spacebrew.cc
String name="Envia coordenadas - Gertrudes";
String description="Envia coordenadas geograficas";
String envia = "envia para gegê";
String reset = "reset";
String kill = "kill";
String quit = "quit";

//booleanos
boolean recebido = false;
boolean localizacao = false;

//cores
color corEspera = color(200);
color corEnviado = color(75);
color cenvia = corEspera;
color creset = corEspera;
color ckill = corEspera;
color cquit = corEspera;


void setup() {
  size(displayWidth, displayHeight);
  context = getActivity();
  orientation(PORTRAIT);
  background(8, 201, 252);
  sb = new Spacebrew(this);
  sb.addPublish("kill", "boolean", false);
  sb.addPublish("reset", "boolean", false);
  sb.addPublish("quit", "boolean", false);
  sb.addPublish("latitude", "string", latINT);
  sb.addPublish("longitude", "string", longINT);
  //sb.addPublish("altitude", "string", altINT);
  sb.addSubscribe("recebido", "boolean");
  sb.connect(server, name, description);

  noStroke();
  textAlign(CENTER, CENTER);
  textSize(36);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();

  if (location == null) location = new KetaiLocation(this);
  if (location.getProvider() == "none") text("Gps indisponivel. \n Por favor cheque as configuracoes de localização", 0, 0, width, height);
  else {
    if (recebido == true) {
      //tela azul
      background(8, 128, 252);
      //sinal localizacao bolinhas
      if (localizacao = true) {
        pushStyle();
        fill(8, 252, 38);
        noStroke();
        ellipse(width/2-150, height/2 + 200, 120, 120);
        popStyle();
      } else {
        pushStyle();
        fill(252, 69, 8);
        noStroke();
        ellipse(width/2-150, height/2 + 200, 120, 120);
        popStyle();
      }
      pushStyle();
      fill(8, 252, 38);
      noStroke();
      ellipse(width/2+150, height/2 + 200, 120, 120);
      popStyle();
      pushStyle();
      fill(255);
      text("Latitude: " + latitude + "\n" + 
        "Longitude: " + longitude + "\n" + 
        //"Altitude: " + alti + "\n" + 
        "Provedor: " + location.getProvider()
        , 0, 0, width, height);
      text(h + ":" + m + ":" + s, 
        0, 0, width, height-200);
      text("recebido", 0, 0, width+300, height+600);
      text("às " + hspace + ":" + mspace + ":" + sspace, 0, 0, width+300, height+700);
      text("às " + hlocal + ":" + mlocal + ":" + slocal, 0, 0, width-300, height+700);
      text("localizacao", 0, 0, width-300, height+600);
      popStyle();
    } else {
      //tela rosa
      background(252, 8, 184);
      //sinal localizacao bolinhas
      if (localizacao = true) {
        pushStyle();
        fill(8, 252, 38);
        noStroke();
        ellipse(width/2-150, height/2 + 200, 120, 120);
        popStyle();
      } else {
        pushStyle();
        fill(252, 69, 8);
        noStroke();
        ellipse(width/2-150, height/2 + 200, 120, 120);
        popStyle();
      }
      pushStyle();
      noStroke();
      fill(252, 69, 8);
      ellipse(width/2+150, height/2 + 200, 120, 120);
      popStyle();
      pushStyle();
      fill(0);
      text("Latitude: " + latitude + "\n" + 
        "Longitude: " + longitude + "\n" + 
        //"Altitude: " + alti + "\n" + 
        "Provedor: " + location.getProvider()
        , 0, 0, width, height);
      text(h + ":" + m + ":" + s, 
        0, 0, width, height-200);
      text("não recebido", 0, 0, width+300, height+600);
      text("localizacao", 0, 0, width-300, height+600);
      text("às " + hlocal + ":" + mlocal + ":" + slocal, 0, 0, width-300, height+700);
      popStyle();
    }
  }

  //botoes
  //envia
  pushStyle();
  fill(cenvia);
  rect(100, height-350, width-200, 100);
  popStyle();
  pushStyle();
  fill(255);
  text(envia, width/2, height-300);
  popStyle();

  //reset
  pushStyle();
  fill(creset);
  rect(100, height-200, width/3-100, 100);
  popStyle();
  pushStyle();
  fill(255);
  text(reset, ((width/3)/3)*2, height-150);
  popStyle();

  //kill gege
  pushStyle();
  fill(ckill);
  rect(50+width/3, height-200, width/3-100, 100);
  popStyle();
  pushStyle();
  fill(255);
  text(kill, width/2, height-150);
  popStyle();

  //quit gege
  pushStyle();
  fill(cquit);
  rect(2*(width/3), height-200, width/3-100, 100);
  popStyle();
  pushStyle();
  fill(255);
  text(quit, width-(width/3)/2-50, height-150);
  popStyle();
}

void mouseReleased() {
  if ( mouseX >= 100
    && mouseX <= width - 100
    && mouseY >= height-350
    && mouseY <= height-250) {
    cenvia = corEnviado;
    location.getLocation();
    delay(1);
    sb.send("latitude", latINT);
    sb.send("longitude", longINT);
  } else { 
    cenvia = corEspera;
  }//ok

  if ( mouseX >= 100
    && mouseX <= width/3
    && mouseY >= height-200
    && mouseY <= height-100) {
    creset = corEnviado;
    sb.send("reset", true);
    delay(1);
    sb.send("reset", false);
  } else { 
    creset = corEspera;
  }//ok

  if (mouseX >= 50+width/3
    && mouseX <= 50+width/3+width/3-100
    && mouseY >= height-200
    && mouseY <= height-100) {
    ckill = corEnviado;
    sb.send("kill", true);
    delay(1);
    sb.send("kill", false);
  } else { 
    ckill = corEspera;
  }//ok

  if ( mouseX >= 2*(width/3)
    && mouseX <= width - 100
    && mouseY >= height-200
    && mouseY <= height-100) {
    cquit = corEnviado;
    sb.send("quit", true);
    delay(1);
    sb.send("quit", false);
  } else { 
    cquit = corEspera;
  }//ok

  if (mouseX >= 2*(width/3)
    && mouseX <= width - 100
    && mouseY >= height-200
    && mouseY <= height-100) {
    cquit = corEnviado;
    sb.send("quit", true);
    delay(1);
    sb.send("quit", false);
  } else { 
    cquit = corEspera;
  }//ok
}

void onBooleanMessage(String name, boolean value) {
  if (name.equals("recebido") && value == true) {
    recebido = true;
  }
  background(209, 44, 44);
  hspace = hour();
  mspace = minute();
  sspace = second();
  localizacao = false;
}

void onLocationEvent(double _latitude, double _longitude, double _altitude)
{
  hlocal = hour();
  mlocal = minute();
  slocal = second();
  localizacao = true;
  recebido = false;
  longitude = _longitude;
  latitude = _latitude;
  //altitude = _altitude;

  float longi = (float)longitude;
  float lati = (float)latitude;
  //float alti = (float)altitude;
  //println("lat/lon/alt: " + lati + "/" + longi + "/" + alti);

  String longINT = str(longi);
  String latINT = str(lati);
  //String altINT = str(alti);

  sb.send("latitude", latINT);
  sb.send("longitude", longINT);
  //sb.send("altitude", altINT);
}