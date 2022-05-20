class Femenino {
  float x, y, tam, vel;

  Femenino() {
    x = 150;
    y = height-100;
    tam = 50;
    vel = 5;
  }

  void display() {
    noStroke();
    fill( #F57CEF );
    ellipse( x, y, tam, tam );
  }

  void mover() {
    if ( keyPressed ) {
      if ( key == 'w' || key == 'W' ) {
        y = y-vel;
      } 
      if ( key == 's' || key == 'S' ) {
        y = y+vel;
      } 
      if ( key == 'a' || key == 'A' ) {
        x = x-vel;
      } 
      if ( key == 'd' || key == 'D' ) {
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
}
