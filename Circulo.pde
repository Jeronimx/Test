class Circulo {
  Obstaculos o;
  float x, y, tam, vel;
  color c = color( #F57CEF );
  float xo = random( 0, width/2);
  float yo = 0;
  boolean choque = false;
  PImage trofeo;

  Circulo( color c_, float x_, float y_ ) {
    o = new Obstaculos( xo, yo );
    trofeo = loadImage( "trofeo.png" );
    x = x_;
    y = y_;
    c = c_;
    tam = 50;
    vel = 5;
  }

  void display() {
    noStroke();
    fill( c );
    ellipse( x, y, tam, tam );
  }

  void mover() {
    if ( keyPressed ) {
      if ( keyCode == UP ) {
        y = y-vel;
      }
      if ( keyCode == DOWN ) {
        y = y+vel;
      }
      if ( keyCode == LEFT ) {
        x = x-vel;
      }
      if ( keyCode == RIGHT ) {
        x = x+vel;
      }
    }
  }

  void limites() {
    if ( x > width/2 ) {
      x = width/2;
    }
    if ( x < 0 ) {
      x = 0;
    }
    if ( y > height ) {
      y = height;
    }
  }

  void moverMasculino() {
    y--;
    if ( y < 0-tam*2 ) {
      y = 0-tam*2;
      image( trofeo, width-155, y);
      trofeo.resize( 30,30 );
    } 

    println( y );
  }
  
  boolean colision(){
    return false;
    //if( dist( x, y, xo, yo ) < 1 ){
    //  return true;
    //}
  }
  
}
