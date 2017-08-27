//Location SaoPaulo = new Location(-23.57378021, -46.675712); //fundação ema klabin
//Location SaoPaulo = new Location(-23.5561059, -46.6941421); // tomie ohtake
//Location SaoPaulo = new Location(-23.550438, -46.633911); // marco zero Sao paulo
//Location SaoPaulo = new Location(-23.567783631, -46.54456939); // casa
//Location SaoPaulo = new Location(-23.560410, -46.540905); // entre minha casa e casa da ste
// entre eu e ma
//Location SaoPaulo = new Location(-23.558447, -46.611799); // entre eu e fundacao
//Location SaoPaulo = new Location(-23.562475, -46.677915); // dia 1_15/12/16
//Location SaoPaulo = new Location(-23.559858, -46.656396); // dia 2_16/12/16
//Location SaoPaulo = new Location(-23.395712, -46.337143); // dia 3_17/12/16
//Location SaoPaulo = new Location(-23.541064, -46.588066); // dia 4_18/12/16
//Location GEO1;
//Location GEO2;
//float valueLat;
//float valueLong;

public void setupMapa(Location LOCAL, int zoom, int sizeX, int sizeY) {
  Location local1 = new Location(LOCAL);
  Location local2 = new Location(LOCAL);
  GEO1 = local1;
  GEO2 = local2;

  map = new UnfoldingMap(this, "mapa", 5, 5, sizeX, sizeY); 
  map.zoomAndPanTo(LOCAL, zoom);
  //map.zoomToLevel(zoom);
  //map.pan(GEO1, GEO1);

  float maxPanningDistance = 0;
  map.setPanningRestriction(LOCAL, maxPanningDistance);
  map.setZoomRange(12, 12);
  //MapUtils.createDefaultEventDispatcher(this, map);
  delay(1);
  mapaOn = true;
  println("mapa pronto");
  log.println("mapa pronto");
}