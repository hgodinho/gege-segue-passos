//
//  definicoes.h
//
//  Henrique Godinho @ 01/03/17.
//
////////////////////////////////
//DEFINICOES ARDUINO {pinagem}//
////////////////////////////////
//ultima atualizacao das definicoes de pinagem: 01/03 16:56
//igual projeto fritzing placa
#define DIRX 2 //ok
#define STEPX 3 //ok
#define MS2X 4   //ok
#define SERVO 11 //ok
#define ENABLEX 5 //normal LOW, envia HIGH pra desligar motores mantendo home //ok
#define MS1X 13 //ok
#define DIRY 9 //ok
#define STEPY 10 //ok
#define MS2Y 7 //ok
#define ENABLEY 6 //normal LOW, envia HIGH pra desligar motores mantendo home //ok
#define MS1Y 8 //ok
#define X0 A0 // limite HOME X
#define X1 A1 // limite FINAL X
#define Y0 A2 // limite HOME Y
#define Y1 A3 // limite FINAL Y
#define ON 12 //opcional jumper d12 no garagino ate o +5v do ed-x *(soldei um resistor 100r)05/03/17*

//definicoes gerais
#define maxX0 350
#define maxY0 100
#define maxX1 100
#define maxY1 100
#define zero 0
#define sobe 0
#define desce 180

///////////
//VARIAVEIS
///////////
//tempo
unsigned long tempoPassado = 0;
const long dormeEm = 600000; //10 minutos.

//inteiros
int zerox = 1;
int zeroy = 1;
int fimx = 0;
int fimy = 0;
int PassoX, PassoY;
long passos[2];
long passosAtuais[2];

//strings/char
char val;
String pen = "sobe";
String dados;
String recebidoX, recebidoY, recebidoC;

//booleanos
boolean calibrado = false;
boolean passodado = false;

/////////
////////
///////
//////
/////
////
///
//
