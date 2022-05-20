class Circulo{
  
  float x, y, tam, vel;
  color c = color( #F57CEF );
  
  Circulo( color c_, float x_, float y_ ) {
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
  
  void moverMasculino(){
    y--;
  }
  
  
}
