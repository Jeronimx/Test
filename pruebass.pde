import oscP5.*;

//=======================================
//      variables de calibración

float MIN_AMP = 60;
float MAX_AMP = 80;
float MIN_PITCH = 60;
float MAX_PITCH = 80;
float f = 0.2;
float vel = 0.3;
boolean monitor = false;
boolean HaySonido = false;
boolean agudo = false;
boolean grave = false;
boolean back = false;
float m, tinte;

color red = color(255,0,0);
color blue = color(0,0,255);
//=======================================

OscP5 osc; // declaracion del objeto osc

float amp, pitch, ruido;
float tintar = 120;
GestorSenial gestorAmp;

ArrayList<Circulo> circulos;
PGraphics grafico;
int maximo = 0;
PImage fondo, mascara;
int alto = 0;
int bajo = 0;
boolean LimiteDeCirculos = false;
String estado = "estado-inicial";
float x1,y1;
Fondo F;


void setup() {
  size(400, 600);
  osc = new OscP5(this, 12345);
  F = new Fondo();
  gestorAmp = new GestorSenial(MIN_AMP, 100, f);
  colorMode(RGB);
  circulos = new ArrayList<Circulo>();
  grafico = createGraphics(400, 600);
  frameRate(60);
  /*imageMode(CENTER);
   fondo = createImage( 380, 580, RGB );
   mascara = loadImage( "mascara.jpg" );
   fondo.mask( mascara );
   image( fondo, width/2, height/2);*/
   x1 = random( 0, width);
   y1 = random(0,height);
}




void draw() {
  background(0);
  HaySonido = amp > MIN_AMP;
  agudo = pitch > MAX_PITCH;
  grave = pitch > MIN_PITCH && pitch < MAX_PITCH;
  m = map( pitch, MIN_PITCH, MAX_PITCH, red, blue );
  tinte = m; 
  
  
  
  println(maximo, "mousePressed está", mousePressed);

  println("alto:", alto);
  
  
  
  //if (LimiteDeCirculos) {
  //  if (HaySonido) {
  //    alto+=10;
  //  } else alto-=5;
  //  if( alto <= -1 ){
  //    alto = 0;
  //  }
  //}  
 if( LimiteDeCirculos ){
  if( HaySonido ){
     alto+=10;
   }  else alto-=5;
   if( alto <= -1 ){
      alto = 0;
    } 
   
   //if( grave ){
   //  bajo+=10;
   //}  else bajo-=5;
   //if( bajo <= -1 ){
   //   bajo = 0;
   // } 
 }
    println( "bajo" + grave );

  grafico.beginDraw();
  grafico.background(0);
  grafico.noStroke();
  grafico.fill( m, 0, 210 );
  grafico.ellipse(x1, y1, alto, alto);
  grafico.endDraw();
  //tint(255, 40, 300);
  //image(grafico, 0, 0);

   
   
  if ( !LimiteDeCirculos ) {

    nuevoCirculo();
  }

  for (Circulo c : circulos) {

    c.dibujar();
    c.dibujar(grafico);
  }
  
  if( ruido > 200 ){
    back = true;
  } 
  F.dibujarMargen();
  
  
  
  //if( agudo ){  
  //background( 0 );
  // } else agudo = false;
}


void nuevoCirculo() {

  float x = random(width);
  float y = random(height);


  boolean valido = true;
  for (Circulo c : circulos) {
    float d = dist(x, y, c.x, c.y);
    if (d - 5 < c.r) {
      valido = false;
      if (maximo >= 100) {
        LimiteDeCirculos = true;
      }
    }
  }

  if (valido && HaySonido) {
    maximo++;
    circulos.add(new Circulo (x, y));
  }
}

void oscEvent (OscMessage m) {

  if (m.addrPattern().equals("/amp")) {

    amp = m.get(0).floatValue();
    //println("amp:",amp);
    println(HaySonido);
  }

  if (m.addrPattern().equals("/pitch")) {

    pitch = m.get(0).floatValue();
    println("pitch:", pitch);
  }
  
  if (m.addrPattern().equals("/ruido")) {
    ruido = m.get(0).intValue();
    println("ruido:", ruido);
  }
  
}
