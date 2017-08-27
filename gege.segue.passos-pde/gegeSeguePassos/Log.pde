public void Log() {
  contagem = loadStrings("log/count.txt");
  int i = int(contagem[0])+1;
  logcount = createWriter("log/count.txt");
  logcount.println(i);
  logcount.flush();
  logcount.close();

  log = createWriter("log/"+
    "log#"+i+
    "@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s"+
    ".txt");

  log.println("comeco_log"+
    "@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s");
}