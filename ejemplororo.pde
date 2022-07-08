float x, y, tam, obstaculoX, obstaculoY, vel;
String estado = "inicio";

void setup(){
  size(429, 600);
  textAlign( CENTER );  
  x = width/2;
  y = 50;
  tam = 50;
  obstaculoX = width/2;
  obstaculoY = height/2;
  vel = 2;
}

void draw(){
  background( 150 );
  println( estado );
  //auto
  if( estado.equals( "inicio" ) ){
    textSize( 30 );
    text( "Presiona R para iniciar", width/2, height/2 );
      if( key == 'r' ){
        estado = "juego";
      }
  }
  
  if( estado.equals( "juego" ) ){
      line( 0, height-100, width, height-100);
      movimiento();
      obstaculo();
      ganar();
      perder();
      reiniciar();
  }
  
  if( estado.equals( "ganaste" ) ){
        textSize( 50 );
        fill( 0 );
        text( "GANASTE", width/2, height/2 );
        reiniciar();
  }
  
  if( estado.equals( "perdiste" ) ){
     textSize( 50 );
     fill( 0 );
     text( "PERDISTE", width/2, height/2 );
     reiniciar();
  }
  
  
}

void movimiento(){
      ellipse( x, y, tam, tam );
        y = y+5;
        if ( keyCode == LEFT ) {
          x = x-vel;
        }
        if ( keyCode == RIGHT ) {
          x = x+vel;
        }
}

void obstaculo(){
  fill(255,0,0);
  rect( obstaculoX, obstaculoY, 60,60 );
}

void ganar(){
  if( y > height-100 ){
    estado = "ganaste";
  }
}

void perder(){
  float colision = dist( x, y, obstaculoX, obstaculoY );
  
  if( colision < tam ){
    estado = "perdiste";
  }
}

void reiniciar(){
  if( key == 'p' ){
   estado = "inicio";
   x = width/2;
   y = 50;
  }
}
