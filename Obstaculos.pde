class Obstaculos {
  
  float x, y,ancho,alto;
PImage obstaculo;

  Obstaculos(float x_, float y_, float ancho_, float alto_) {
    x = x_;
    y = y_ ;
    ancho=ancho_;
    alto=alto_;
   obstaculo= loadImage( "barrera.png" );
  
  }

  void display( ) {
    
    image( obstaculo, x, y,ancho,alto);
    
  }

  
  float posX(){
    return x;
  }
  
  float posY(){
    return y;
  }
  
}
