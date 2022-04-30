String estado = "Dibujar Circulos";
int cantidad = 10;
int cantidadDeCirculos = 0;
Circulo c[];
void setup() {
  imageMode( CENTER );
  frameRate( 3 );
  colorMode( HSB, 360 );
  size( 400, 600 );
  c = new Circulo[cantidad];
  for (int i = 0; i < cantidad; i++) {
    c[i] = new Circulo();
  }
}

void draw() {

  for ( int i = 0; i < cantidad; i++ ) {


    if ( mousePressed && estado.equals( "Dibujar Circulos" ) ) {
      c[i].dibujarCirculo( int( random(0, width) ), int(random(0, height) ), 50);
      cantidadDeCirculos ++;
        if( cantidadDeCirculos >= 70 ) {
        estado = "Colorear Circulos"; }
    } else if ( estado.equals( "Colorear Circulos" ) ) {
      c[i].actualizar();
    }
  }
}
