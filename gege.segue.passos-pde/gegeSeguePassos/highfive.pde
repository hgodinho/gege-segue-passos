public void highfive() {
  int agora = millis();
  //int razao = agora - tempoPassado1;
  int razao2 = agora - tempoPassado2;
  gege.write("H5\r");
  delay(1000);

  //CORES PARA HIGHFIVE STATUS EM DEBUGGEGE
  if (agora - tempoPassado2 >= int(highfiveFalse*0.33)) {
    corTempo = verde;
  }
  if (agora - tempoPassado2 >= int(highfiveFalse*0.66)) {
    corTempo = amarelo;
  }
  if (agora - tempoPassado2 >= highfiveFalse-1000) {
    corTempo = vermelho;
  }

  if (agora - tempoPassado2 >= highfiveFalse && highfive == false) {
    println("2"+"-"+"agora"+agora+" "+"passado"+tempoPassado2+" "+"highfiveEM"+highfiveFalse+" "+"="+razao2);
    log.println("reset_log_highfive"+
      "@"+day()+"-"+month()+"-"+year()+"-"+hour()+"h"+minute()+"m"+second()+"s");
    log.flush();
    sb.send("highfive", false);
    olaGege();
    linha = color(random(0, 255), random(0, 255), random(0, 255));
    corTempo = color(0, 255, 0);
    println("resetandoGege");
  }
}