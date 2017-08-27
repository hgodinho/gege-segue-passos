
public void quit() {
  quit = true;
  feed = fim;
  println(feed);
  int i = int(contagem[0])+1;
  save("frames/"+"frame#"+i+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s"+".png"); 
  println("frame salvo");
  log.println("frame salvo");
  log.println(feed);
  log.println("fim_log"+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s");
  log.flush();
  log.close();
  exit();
}