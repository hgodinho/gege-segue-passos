void recebeDados() {
  if (Serial.available() > 0) {
    tempoPassado = millis();
    dados = Serial.readStringUntil("\r");
    if (dados.startsWith("pos$")) {
      int recebidoANTESx = PassoX;
      int recebidoANTESy = PassoY;
      recebidoX = dados.substring(5, 9);
      recebidoY = dados.substring(10, 14);
      recebidoC = dados.substring(14, 18);
      PassoX = recebidoX.toInt();
      PassoY = recebidoY.toInt();

      if (recebidoC.equals("desc")) {
        pen = "desce";
      }
      if (recebidoC.equals("sobe")) {
        pen = "sobe";
      }

      passo(PassoX, PassoY, "pos", pen);
      passodado = false;
      //      Serial.print("eixos$ ");
      //      Serial.print(PassoX);
      //      Serial.print(" ");
      //      Serial.print(PassoY);
      //      Serial.print(" ");
      //      Serial.println(pen);
    }

    //menu
    if (dados == "H5\r") {
      Serial.println("h5");
    }

    if (dados == "z\r") {
      Serial.println("z");
      calibra();
    }
    if (dados == "f\r") {
      Serial.println("f");
      achaFinal();
    }
    if (dados == "r\r") {
      Serial.println("r");
      passo(1000, 0, "mov", pen);
    }
    if (dados == "l\r") {
      Serial.println("l");
      passo(-1000, 0, "mov", pen);
    }
    if (dados == "u\r") {
      Serial.println("u");
      passo(0, 1000, "mov", pen);
    }
    if (dados == "d\r") {
      Serial.println("d");
      passo(0, -1000, "mov", pen);
    }
    if (dados == "c\r") {
      Serial.println("desce");
      caneta.write(desce);
      delay(20);
    }
    if (dados == "v\r") {
      Serial.println("sobe");
      caneta.write(sobe);
      delay(20);
    }
  }
}



