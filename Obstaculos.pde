class Obstaculos {
  
  float x, y, tam;

  Obstaculos( float x_, float y_) {
    x = x_;
    y = y_;
    tam = random( 50, 70 );
  }

  void display() {
    fill( 0 );
    ellipse( x, y, tam, tam );
  }

  void mover() {
    y++;
  }
}
