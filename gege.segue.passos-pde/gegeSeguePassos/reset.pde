public void reset() {
  reset = true;
  log.println("reset_log"+
    "@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s");
  log.flush();
  linha = color(random(0, 255), random(0, 255), random(0, 255));
  olaGege();
}