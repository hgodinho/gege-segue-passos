//GEGE.segue.passos V2.0
//de V1.0 para V2.0>>>
//alteracao de placa, desenvolvimento por fritzing.
//serial handshake, não mais firmata.

/////////////
//BIBLIOTECAS
/////////////
#include "definicoes.h"
#include <Servo.h>
#include <AccelStepper.h>
#include <MultiStepper.h>

///////
//SETUP
///////
Servo caneta;
AccelStepper eixoX(1, STEPX, DIRX);
AccelStepper eixoY(1, STEPY, DIRY);
MultiStepper eixos;


void setup() {
  Serial.begin(115200);
  caneta.attach(SERVO);
  //.....................................
  //  MS1       MS2     RESOLUTION    |//
  //..................................|//
  //  LOW       LOW     FULL STEP     |//
  //  HIGH      LOW     HALF STEP     |//
  //  LOW       HIGH    QUARTER STEP  |//
  //  HIGH      HIGH    EIGHT STEP    |//
  //..................................|//
  pinMode(MS1X, OUTPUT);
  pinMode(MS2X, OUTPUT);
  pinMode(MS1Y, OUTPUT);
  pinMode(MS2Y, OUTPUT);
  //xxxxxxx
  digitalWrite(MS1X , LOW);
  digitalWrite(MS2X , HIGH);
  //yyyyyyy
  digitalWrite(MS1Y , HIGH);
  digitalWrite(MS2Y , HIGH);
  pinMode(ENABLEX, OUTPUT);
  pinMode(ENABLEY, OUTPUT);
  delay(1);

  Serial.println("gege na linha");

  //xxxxxxx 
  eixoX.setMaxSpeed(2000);
  eixoX.setAcceleration(2000);
  eixoX.setSpeed(2000);
  eixoX.setEnablePin(ENABLEX);
  eixoX.setPinsInverted(false, false, true);
  eixoX.enableOutputs();
  
  //yyyyyyy
  eixoY.setMaxSpeed(800);
  eixoY.setAcceleration(800);
  eixoY.setSpeed(800);
  eixoY.setEnablePin(ENABLEY);
  eixoY.setPinsInverted(false, false, true);
  eixoY.enableOutputs();

  //eixos
  eixos.addStepper(eixoX);
  eixos.addStepper(eixoY);

  //caneta
  caneta.write(180);
  delay(20);
}

void loop() {
  //tempo correndo
  unsigned long Agora = millis();
  if (Agora - tempoPassado >= dormeEm) {//dorme motor em 10 minutos
    eixoX.disableOutputs();
    eixoY.disableOutputs();
    Serial.println("motores dormindo");
  }
  //calibra
  while (calibrado == false) {
    calibra();
  }
  if (digitalRead(ON) == 0) {
    calibrado = false;
  }

  //movimenta
  if (eixoX.currentPosition() != PassoX || eixoY.currentPosition() != PassoY) {
    passo(PassoX, PassoY, "pos", pen);
  }
  else {
    passo(PassoX, PassoY, "pos", pen);
  }

//  if (pen == "desce") caneta.write(desce);
//  if (pen == "sobe") caneta.write(sobe);

  //coleta dados
  recebeDados();
}





