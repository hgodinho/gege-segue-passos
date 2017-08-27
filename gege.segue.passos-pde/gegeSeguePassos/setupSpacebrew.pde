Spacebrew sb;
String server="gertrudes.herokuapp.com/index.html?server=gertrudes.herokuapp.com&port=80";
String name="Recebe coordenadas - Gertrudes";
String description="Envia coordenadas geograficas";
// link para visualizacao das conexoes:
// http://spacebrew.github.io/spacebrew/admin/admin.html?server=gertrudes.herokuapp.com&port=80

public void setupSpacebrew() { 
  sb = new Spacebrew(this);
  sb.addSubscribe("kill", "boolean");
  sb.addSubscribe("reset", "boolean");
  sb.addSubscribe("quit", "boolean");
  sb.addSubscribe("latitude", "string");
  sb.addSubscribe("longitude", "string");
  //sb.addSubscribe("alt", "string");
  sb.addPublish("recebido", "boolean", false);
  sb.addPublish("highfive", "boolean", true);
  sb.connect(server, name, description);
  delay(1);
  println("spacebrew pronto");
  log.println("spacebrew pronto");
  spacebrewOn = true;
}