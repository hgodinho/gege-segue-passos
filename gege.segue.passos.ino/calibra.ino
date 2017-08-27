void calibra() {
  //ccalibra caneta
  for (int i = 180; i >= 0; i -= 1) {
    caneta.write(i);
    delay(10);
  }
  for (int i = 180; i >= 0; i -= 1) {
    caneta.write(i);
    delay(10);
  }
  //habilita eixos
  eixoX.enableOutputs();
  eixoY.enableOutputs();

  //procura o 0x
  while (digitalRead(ON) == 1) {
    achaZero();

    while (zerox > 0 || zeroy > 0) {
      passo(1000, 1000, "pos", "sobe");
      //delay(100); 
      achaZero();
    }

    //    while (zerox > 0) {
    //      eixoX.moveTo(500);
    //      eixoX.run();
    //      delay(1000);
    //      achaZero();
    //    }
    //    while (zeroy > 0) {
    //      eixoY.moveTo(500);
    //      eixoY.run();
    //      delay(1000);
    //      achaZero();
    //    }


    while (fimx == 0 && fimy == 0) {
      achaFinal();
    }
    PassoX = fimx / 2;
    PassoY = fimy / 2;
    calibrado = true;
    Serial.println("fim calibragem");
    break;
  }
}

void achaZero() {
  Serial.println("zerando");
  while (analogRead(X0) < maxX0) {
    eixoX.setSpeed(-3000);
    eixoX.runSpeed();
    //if (digitalRead(ON) == 0);
    if (analogRead(X0) > maxX0) {
      eixoX.setCurrentPosition(zero);
      zerox = eixoX.currentPosition();
      delay(1);
    }
  }
  while (analogRead(Y0) < maxY0) {
    eixoY.setSpeed(-3000);
    eixoY.runSpeed();
    if (analogRead(Y0) > maxY0) {
      eixoY.setCurrentPosition(zero);
      zeroy = eixoY.currentPosition();
      delay(1);
    }
  }
  tempoPassado = millis();
  Serial.print("zerox ");
  Serial.print(zerox);
  Serial.print(" zeroy ");
  Serial.println(zeroy);
}

void achaFinal() {
  Serial.println("procurando limites");
  while (analogRead(X1) < maxX1) {
    eixoX.setSpeed(3000);
    eixoX.runSpeed();
    fimx = eixoX.currentPosition();
    delay(1);
  }
  while (analogRead(Y1) < maxY1) {
    eixoY.setSpeed(2000);
    eixoY.runSpeed();
    fimy = eixoY.currentPosition();
    delay(1);
  }
  tempoPassado = millis();
  Serial.print("gege$ fimx ");
  Serial.print(fimx);
  Serial.print(" fimy ");
  Serial.println(fimy);
}

