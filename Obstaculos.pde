class Obstaculos{
  float x,y,tam;
  
  Obstaculos(){
    x = random( 0, width/2 );
    y = 0;
    tam = random( 50,70 );
  }
  
  void display(){
    fill( 0 );
    ellipse( x,y,tam,tam );
  }
  
  void mover(){
    y++;
  }

}
