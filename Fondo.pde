class Fondo {
  float ry = height-4000;
  float vel = 5;
  PImage ruta;

  Fondo() {
    ruta = loadImage( "ruta.jpg" );
    background(120);
  }

  void display() {
    image( ruta, 0, ry);
  }
  void fondoLoop() {
    ry = ry+vel;
    if ( ry > 0 ) {
      ry = height-4000;
    }
  }
}
