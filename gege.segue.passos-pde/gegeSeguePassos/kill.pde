
public void kill() {
  kill = true;
  stream = false;
  gegeOn = false;
  feed = fim;
  println(feed);
  gege.stop();
  log.println(feed);
  log.println("fim_log"+"@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s");
  log.flush();
  delay(1000);
}