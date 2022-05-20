float x, y, tam, vel,ry;
PImage ruta;
void setup(){
  size( 600,700 );
  x = 150;
  y = height-100;
  tam = 50;
  vel = 5;
  ruta = loadImage( "ruta.jpg" );
  ry = height-4000;
}

void draw(){
  background(120);
  image( ruta, 0, ry);
  ry = ry+vel;
      if( ry > 0 ){
        ry = height-4000;
      }
  if( keyPressed ){
    if( key == 'w' || key == 'W' ){
      y = y-vel;
    } 
    if( key == 's' || key == 'S' ){
      y = y+vel;
    } 
    if( key == 'a' || key == 'A' ){
      x = x-vel;
    } 
    if( key == 'd' || key == 'D' ){
      x = x+vel;
    }
  } 
  if( x > width/2 ){
    x = width/2;
  }
  if( x < 0 ){
    x = 0;
  }
  if( y > height ){
    y = height;
  }
  
  
  ellipse( x, y, tam, tam );
  println( ry );
  
  
}
