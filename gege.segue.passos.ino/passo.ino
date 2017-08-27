void passo(int passox, int passoy, String situacao, String pen) {
  if (situacao.equals("pos")) {
    passos[0] = passox;
    passos[1] = passoy;
    if (passodado == false) {
      if (pen == "desce") {
        caneta.write(desce);
        passosAtuais[0] = eixoX.currentPosition();
        passosAtuais[1] = eixoY.currentPosition();
        if (passos != passosAtuais) {
          eixos.moveTo(passos);
          eixos.run();
          //delay(10);
          //Serial.println("p");
        }
        if (passosAtuais[0] == passos[0] && passosAtuais[1] == passos[1]) {
          Serial.println("cheguei");
          passodado = true;
        }
      }
      if (pen == "sobe") {
        caneta.write(sobe);
        passosAtuais[0] = eixoX.currentPosition();
        passosAtuais[1] = eixoY.currentPosition();
        if (passos != passosAtuais) {
          eixos.moveTo(passos);
          eixos.run();
          //delay(10);
          //Serial.println("p");
        }
        if (passosAtuais[0] == passos[0] && passosAtuais[1] == passos[1]) {
          Serial.println("cheguei");
          passodado = true;
        }
      }
    }
  }
  
  if (situacao.equals("mov")) {
    //funcao para passinho
  }
}
