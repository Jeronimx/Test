class Circulo {
  int x, y, tam;
  int colores;
  int vel;

  Circulo() {
    x = int(random( 0, width ) );
    y = int(random(0, height ) );
    tam = 40;
    vel = 50;
    colores = 0;
  }

  void dibujarCirculo( int x, int y, int colores) {
    this.x = x;
    this.y = y;
    this.colores = colores;
    fill( colores );
    ellipse( x, y, tam, tam );
  }

  void actualizar() {
    println( colores );
    
    if ( key == 's' ) {
      colores ++;
    }
  }
}
