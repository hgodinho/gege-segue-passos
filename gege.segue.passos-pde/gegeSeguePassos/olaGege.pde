
public void olaGege() {
  Log();
  if (porta == null) return;
  if (gege != null) gege.stop();
  printArray(Serial.list());
  gege = new Serial(this, porta, 115200);
  gege.bufferUntil('\r');
  highfive = true;
  tempoPassado1 = millis();
  tempoPassado2 = millis();
  if ( spacebrewOn == true) {
    sb.send("highfive", true);
  }
}