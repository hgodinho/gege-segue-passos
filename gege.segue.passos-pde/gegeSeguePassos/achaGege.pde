public void achaGege()
{
  String result = (String) JOptionPane.showInputDialog(frame, 
    "Selecione a usb da gegê", 
    "Selecione a gegê", 
    JOptionPane.QUESTION_MESSAGE, 
    null, 
    Serial.list(), 
    0);
  if (result != null) {
    porta = result;
    olaGege();
  }
}